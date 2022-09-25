extends KinematicBody2D
class_name Player

signal interaction
export(bool) var reflex 

var velocity = Vector2.ZERO
var limit_steps = 100

var current_loop = 1
var current_walk = 0
var current_state = 0
enum {IDLE, WALK, INTERACTION, LOOP}

func _ready():
	connect("interaction",self,"on_Player_interaction")
	pass

func _physics_process(delta):
	match(current_state):
		IDLE:
			_idle()
		WALK:
			_walk()
		INTERACTION:
			_interaction()
		LOOP:
			_loop()


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
	if Input.is_action_just_pressed("ui_accept") and $RayCast.is_colliding():
		current_state = INTERACTION
		return

func _interaction():
	$Animated.play("idle")
	current_state = _interaction_check()

func _loop():
	$Animated.play("loop")
	if current_loop == 1:
		Global.current_state = LOOP
		current_loop -= 1


func _idle_check():
	if Input.is_action_just_pressed("ui_accept"):
		return INTERACTION
	elif Input.is_action_pressed("ui_left") or Input.is_action_pressed("ui_right"):
		return WALK
	elif limit_steps <= 0:
		return LOOP
	return current_state

func _walk_check():
	_verify_current_walk()
	if limit_steps < 0:
		current_state = LOOP
		return
	elif Input.is_action_pressed("ui_left") or Input.is_action_pressed("ui_right"):
		current_state = WALK
		return
	current_state = IDLE

func _interaction_check():
	if $RayCast.is_colliding():
		return current_state
	else:
		return IDLE


func _position_checker():
	if Input.is_action_just_pressed("ui_left"):
		$Animated.flip_h = true
		$RayCast.cast_to.x = -3.5
	elif Input.is_action_just_pressed("ui_right"):
		$Animated.flip_h = false
		$RayCast.cast_to.x = 3.5

func _moves():
	_position_checker()
	if current_state != WALK:
		velocity.x = 0
	elif $Animated.flip_h == true:
		velocity.x = -22
	elif $Animated.flip_h == false:
		velocity.x = 22

func _move_slide():
	if reflex == false:
		velocity = move_and_slide(velocity, Vector2.UP)

func _verify_current_walk():
	if current_walk == 0:
		current_walk = 1
	else:
		current_walk = 0


func _on_Animated_animation_finished():
	if $Animated.animation == "walk" or $Animated.animation == "walk_2":
		if not reflex:
			if limit_steps > 10:
				if $SoundFX/StepsFX.pitch_scale == 0.8:
					$SoundFX/StepsFX.pitch_scale = 1
				else:
					$SoundFX/StepsFX.pitch_scale = 0.8
				$SoundFX/StepsFX.play()
			elif limit_steps <= 10:
				$SoundFX/DramaticStepFX.play()
				$SoundFX/DramaticStepFX.volume_db += 2
			limit_steps -= 1
		print(limit_steps)
		_walk_check()


func _on_Player_interaction():
	pass
