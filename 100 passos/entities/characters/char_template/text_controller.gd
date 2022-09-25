extends Node2D
class_name TextController


signal end_dialog
var concluding

export(Array, int) var dialog_limit
export(Array, String) var text_list
var current_list = 0

var current_dialog = 0
enum {FIRST_VIEW, CONCLUDING, AFTER_CONCLUDING}

func _ready():
	connect("end_dialog",self,"on_end_dialog")
	pass

func _process(delta):
	_text_update()
	match current_dialog:
		FIRST_VIEW:
			if current_list == dialog_limit[0]:
				$additional._global_manage_interaction()
				emit_signal("end_dialog")
			else:
				_skip()
		CONCLUDING:
			if current_list == dialog_limit[1]:
				get_parent().get_node("InteractionFX").play()
				$additional._global_manage_item()
				emit_signal("end_dialog")
			else:
				_skip()
		AFTER_CONCLUDING:
			if current_list == dialog_limit[2]:
				emit_signal("end_dialog")
			else:
				_skip()

func _skip():
	if Input.is_action_just_pressed("ui_accept"):
		get_parent().get_node("InteractionFX").play()
		current_list += 1

func _text_update():
	$Text.text = text_list[current_list]
