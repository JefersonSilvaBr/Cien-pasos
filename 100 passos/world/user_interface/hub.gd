extends Control
class_name HubController

var items_list: Array
var current_item = 2
enum {ASTHMA_INHALER, FLASHLIGHT, KEY, CIGARETTE, RADIO, BATTERY}

func _process(delta):
	_controller()
	match current_item:
			ASTHMA_INHALER:
				$ItemsSelect.play("asthma_inhaler")
			FLASHLIGHT:
				$ItemsSelect.play("flashlight")
			KEY:
				$ItemsSelect.play("key")
			CIGARETTE:
				$ItemsSelect.play("cigarette")
			RADIO:
				$ItemsSelect.play("radio")
			BATTERY:
				$ItemsSelect.play("battery")

func _controller():
	items_list.clear()
	if Global.have_asthma_inhaler:
		items_list.append(ASTHMA_INHALER)
	if Global.have_flashlight:
		items_list.append(FLASHLIGHT)
	if Global.have_key:
		items_list.append(KEY)
	if Global.have_cigarette:
		items_list.append(CIGARETTE)
	if Global.have_radio:
		items_list.append(RADIO)
	if Global.have_battery:
		items_list.append(BATTERY)
		
	if items_list.empty():
		$ItemsSelect.visible = false
	elif Input.is_action_just_pressed("ui_select") or items_list.size() == 1:
		for index in 6:
			current_item += 1
			if current_item == 6:
				current_item = 0
			for i in items_list.size():
				if current_item == items_list[i]:
					$ItemsSelect.visible = true
					return
