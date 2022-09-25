extends CanvasLayer

onready var animation_ref = get_node("Animation")
var level_trans : NodePath

func _final(level:String):
	level_trans = level
	$RadioFX.play()
	print(true)
	animation_ref.play("radio")

func _on_Animation_animation_finished(anim_name):
	if anim_name == "radio":
		animation_ref.play("fade_out")
		get_tree().change_scene(level_trans)
		$RadioFX.stream_paused = true
		$PartAA.play()
		$PartBB.play()
		$Voice.play()
	elif anim_name == "fade_out":
		TransitionLevel.get_node("SoundFX/SoundScapeFX").pause_mode = true
