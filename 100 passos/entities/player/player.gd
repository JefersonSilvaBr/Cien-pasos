extends KinematicBody2D
class_name Player

var velocity = Vector2.ZERO
var limit_steps = 100

var current_state = 0
enum {IDLE, WALK, INTERACTION, LOOP}


func _physics_process(delta):
	match(current_state):
		IDLE:
			_idle()
		WALK:
			_walk()
		INTERACTION:
			pass
		LOOP:
			_loop()


func _idle():
	$Animated.play("idle")
	_position_checker()
	_moves()
	_move_slide()
	current_state = _idle_check()

func _walk():
	$Animated.play("walk")
	_moves()
	_move_slide()

func _loop():
	$Animated.play("loop")
	if $Mask.modulate.a < 255:
		$Mask.modulate.a += 1
	else: 
		get_tree().change_scene("res://world/scenes/level.tscn")

func _idle_check():
	if Input.is_action_pressed("ui_left") or Input.is_action_pressed("ui_right"):
		return WALK
	elif limit_steps <= 0:
		return LOOP
	return current_state

func _walk_check():
	if limit_steps <= 0:
		current_state = LOOP
	current_state = IDLE


func _position_checker():
	if Input.is_action_just_pressed("ui_left"):
		$Animated.flip_h = true
	elif Input.is_action_just_pressed("ui_right"):
		$Animated.flip_h = false

func _moves():
	if current_state != WALK:
		velocity.x = 0
	elif $Animated.flip_h == true:
		velocity.x = -60
	elif $Animated.flip_h == false:
		velocity.x = 60

func _move_slide():
	velocity = move_and_slide(velocity, Vector2.UP)


func _on_Animated_animation_finished():
	if $Animated.animation == "walk":
		limit_steps -= 2
		print(limit_steps)
	_walk_check()
