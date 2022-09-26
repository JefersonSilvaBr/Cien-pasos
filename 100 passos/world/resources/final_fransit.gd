extends CanvasLayer

onready var animation_ref = get_node("Animation")
var level_trans : NodePath

func _final(level:String):
	level_trans = level
	TransitionLevel.get_node("SoundFX/SoundScapeFX").stop()
	$RadioFX.play()
	print(true)
	animation_ref.play("radio")

func _on_Animation_animation_finished(anim_name):
	if anim_name == "radio":
		animation_ref.play("fade_out")
		$RadioFX.stop()
		get_tree().change_scene(level_trans)
	elif anim_name == "fade_out":
		if Global.loop_counter > 0:
			$PartAA.play()
			$PartBB.play()
			$Voice.play()
	elif anim_name == "credits":
		get_tree().change_scene("res://world/user_interface/creditos.tscn")
