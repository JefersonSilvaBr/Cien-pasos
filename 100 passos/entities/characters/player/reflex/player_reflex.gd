extends KinematicBody2D
class_name PlayerReflex

var velocity = Vector2.ZERO

export(bool) var start
export(bool) var reverse

var current_walk = 0
var current_state = 0
enum {IDLE, WALK}

func _ready():
	pass

func _physics_process(delta):
	match(current_state):
		IDLE:
			_idle()
		WALK:
			_walk()


func _idle():
	$Animated.play("idle")
	_moves()
	_move_slide()
	current_state = _idle_check()

func _walk():
	if current_walk == 0:
		$Animated.play("walk")
	else:
		$Animated.play("walk_2")
	_moves()
	_move_slide()


func _idle_check():
	if Input.is_action_pressed("ui_left") or Input.is_action_pressed("ui_right"):
		return WALK
	return current_state

func _walk_check():
	_verify_current_walk()
	if Input.is_action_pressed("ui_left") or Input.is_action_pressed("ui_right"):
		current_state = WALK
		return
	current_state = IDLE


func _position_checker():
	if reverse:
		if Input.is_action_just_pressed("ui_left"):
			$Animated.flip_h = false
		elif Input.is_action_just_pressed("ui_right"):
			$Animated.flip_h = true
	else:
		if Input.is_action_just_pressed("ui_right"):
			$Animated.flip_h = false
		elif Input.is_action_just_pressed("ui_left"):
			$Animated.flip_h = true

func _moves():
	_position_checker()
	if current_state != WALK:
		velocity.x = 0
	elif $Animated.flip_h == true:
		velocity.x = -22
	elif $Animated.flip_h == false:
		velocity.x = 22

func _move_slide():
	if start:
		velocity = move_and_slide(velocity, Vector2.UP)

func _verify_current_walk():
	if current_walk == 0:
		current_walk = 1
	else:
		current_walk = 0


func _on_Animated_animation_finished():
	if $Animated.animation == "walk" or $Animated.animation == "walk_2":
		_walk_check()


func _on_CheckEnd_area_entered(area):
	if area.name == "CheckEnd":
		FinalFransit.animation_ref.play("credits")
