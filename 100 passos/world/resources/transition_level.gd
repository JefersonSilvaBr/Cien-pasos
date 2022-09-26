extends CanvasLayer

onready var animation_ref = get_node("Animation")
var level_trans : NodePath

func _fade_in(level:String):
	level_trans = level
	$SoundFX/SoundScapeFX.pause_mode = true
	$SoundFX/LoopFX.play()
	animation_ref.play("faid_in")
	_count_loops()

func _count_loops():
	$Text.text = str("intentos:", Global.loop_counter)

func _on_Animation_animation_finished(anim_name):
	if anim_name == "faid_in":
		animation_ref.play("faid_out")
		get_tree().change_scene(level_trans)
	elif anim_name == "faid_out":
		pass
