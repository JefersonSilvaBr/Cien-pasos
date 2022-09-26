extends Control

func _process(delta):
	if Input.is_action_just_pressed("ui_accept"):
		FinalFransit.get_node("PartAA").stop()
		FinalFransit.get_node("PartBB").stop()
		get_tree().change_scene("res://world/user_interface/menu.tscn")
