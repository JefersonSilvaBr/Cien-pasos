extends Control

var it_is = true
var current_state = 0
enum {START, CREDITS, QUIT}

func _ready():
	$Effects/SoundFX/SoundMenuFX.play()

func _process(delta):
	TransitionLevel.get_node("SoundFX/SoundScapeFX").stop()
	
	match current_state:
		START:
			_select("Start")
			_skip("---", "Start_right")
		CREDITS:
			_select("Credits")
			_skip("Credits_left", "Credits_right")
		QUIT:
			_skip("Quit_left", "---")

func _skip(anim_left , anim_right:String):
	if current_state == 0:
		pass
	elif Input.is_action_just_pressed("ui_left") and it_is:
		$Effects/SoundFX/SkipFX.play()
		$Select/Animation.play(anim_left)
		current_state -= 1
		it_is = false
	if current_state == 2:
		pass
	elif Input.is_action_just_pressed("ui_right") and it_is:
		$Effects/SoundFX/SkipFX.play()
		$Select/Animation.play(anim_right)
		current_state += 1
		it_is = false

func _select(anim):
	if Input.is_action_just_pressed("ui_accept") and it_is:
		$Effects/SoundFX/SoundMenuFX.stop()
		$Effects/SoundFX/SelectFX.play()
		$Select/Animation.play(anim)
		it_is = false

func _on_Animation_animation_finished(anim_name):
	if anim_name == "Start":
		get_tree().change_scene("res://world/scenes/level.tscn")
	elif anim_name == "Credits":
		get_tree().change_scene("res://world/user_interface/creditos.tscn")
	it_is = true
