extends Node2D

onready var char_ref = get_parent()
onready var child = get_parent().get_parent()

func _global_manage_interaction():
	pass

func _global_manage_item():
	pass

func _controler():
	char_ref.current_dialog = char_ref.FIRST_VIEW
	char_ref.current_list = 0
