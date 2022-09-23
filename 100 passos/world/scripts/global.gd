extends Node

var loop_counter = 0
var step_counter = 0

var have_asthma_inhaler = false
var have_flashlight = false
var have_key = false
var have_radio = false
var have_battery = false
var have_cigarette = false

var interact_mother = true
var interact_child = false
var interact_guard = false
var interact_bathroom_guy = true
var interact_smoker = false

var current_state = 0
enum {MENU, PLAYING, PAUSE, LOOP, TRANSIT}

func _process(delta):
	match current_state:
		MENU:
			pass
		PLAYING:
			pass
		PAUSE:
			pass
		LOOP:
			_loop()
		TRANSIT:
			pass


func _loop():
		loop_counter += 1
		_items_reset()
		get_tree().change_scene("res://world/scenes/level.tscn")
		current_state = PLAYING


func _items_reset():
	have_asthma_inhaler = false
	have_flashlight = false
	have_key = false
	have_radio = false
	have_battery = false
	have_cigarette = false
