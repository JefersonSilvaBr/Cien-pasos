extends ItemTemplate
class_name Cabinet

export(bool) var have_item
onready var radio_ref = get_parent().get_node("Radio/Animated")

func _process(delta):
	if Input.is_action_just_pressed("ui_accept") and it_is and $Animated.animation != "open":
		$Animated.play("open")
		$OpenFX.play()
	else:
		pass

func _on_Cabinet_body_entered(body):
	it_is = true

func _on_Cabinet_body_exited(body):
	it_is = false


func _on_Animated_animation_finished():
	if $Animated.animation == "open" and have_item and Global.have_radio == false:
			radio_ref.visible = true

func _on_Cabinet_area_entered(area):
	if area.name == "Radio":
		have_item = true
