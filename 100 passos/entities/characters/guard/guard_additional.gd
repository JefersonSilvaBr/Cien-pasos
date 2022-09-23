extends Node2D

onready var char_ref = get_parent()
onready var child = get_parent().get_parent()

func _global_manage_interaction():
	Global.interact_guard = true

func _global_manage_item():
	char_ref.concluding = true
	Global.have_flashlight = false

func _controler():
	if char_ref.concluding == true:
		char_ref.current_dialog = char_ref.AFTER_CONCLUDING
		char_ref.current_list = 4
	elif Global.have_flashlight == true:
		char_ref.current_dialog = char_ref.CONCLUDING
		char_ref.current_list = 2
	else:
		char_ref.current_dialog = char_ref.FIRST_VIEW
		char_ref.current_list = 0
	print(Global.interact_guard)
