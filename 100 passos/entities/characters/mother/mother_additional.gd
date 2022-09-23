extends Node2D

onready var char_ref = get_parent()
onready var child = get_parent().get_parent()

func _global_manage_interaction():
	Global.interact_mother = true

func _global_manage_item():
	char_ref.concluding = true
	child.get_child(0).disabled = true
	Global.have_asthma_inhaler = false

func _controler():
	if Global.have_asthma_inhaler == true:
		char_ref.current_dialog = char_ref.CONCLUDING
		char_ref.current_list = 2
	elif char_ref.concluding == true:
		char_ref.current_dialog = char_ref.AFTER_CONCLUDING
		char_ref.current_list = 4
	else:
		char_ref.current_dialog = char_ref.FIRST_VIEW
		char_ref.current_list = 0
	print(Global.interact_mother)
