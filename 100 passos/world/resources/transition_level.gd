extends CanvasLayer

onready var animation_ref = get_node("Animation")
var level_trans : NodePath

func _fade_in(level:String):
	level_trans = level
	$SoundFX/SoundScapeFX.pause_mode = true
	$SoundFX/LoopFX.play()
	animation_ref.play("faid_in")

func _on_Animation_animation_finished(anim_name):
	if anim_name == "faid_in":
		get_tree().change_scene(level_trans)
		animation_ref.play("faid_out")
	elif anim_name == "faid_out":
		$SoundFX/SoundScapeFX.play()
