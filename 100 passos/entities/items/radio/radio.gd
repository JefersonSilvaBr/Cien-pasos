extends ItemTemplate
class_name Radio

func _ready():
	Global.have_radio = false

func _process(delta):
	if it_is and Input.is_action_just_pressed("ui_accept") and $Animated.visible:
		Global.have_radio = true
		queue_free()

func _on_Radio_body_entered(body):
	it_is = true

func _on_Radio_body_exited(body):
	it_is = false
