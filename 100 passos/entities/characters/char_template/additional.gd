extends Node2D

onready var char_ref = get_parent()

func _global_manage_interaction():
	Global.interact_mother = true

func _global_manage_item():
	Global.have_asthma_inhaler = true

func _controler():
	if Global.loop_counter == 0:
		char_ref.current_dialog = char_ref.FIRST_VIEW
		char_ref.current_list = 0
	elif Global.interact_mother == true:
		char_ref.current_dialog = char_ref.SECOND_VIEW
		char_ref.current_list = 3
	else:
		char_ref.current_dialog = char_ref.CONCLUDING
		char_ref.current_list = 7
	print(Global.interact_mother)
