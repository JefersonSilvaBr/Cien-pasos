extends Light2D

onready var child = get_parent()

func _on_Animated_animation_finished():
	if child.get_child(2).animation == "flashlight" and child.get_child(4).concluding:
		print("flash")
		visible = true
