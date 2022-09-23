extends ItemTemplate
class_name Flashlight

func _ready():
	Global.have_flashlight = false

func _process(delta):
	if it_is and Input.is_action_just_pressed("ui_accept"):
		Global.have_flashlight = true
		queue_free()

func _on_Flashlight_body_entered(body):
	it_is = true

func _on_Flashlight_body_exited(body):
	it_is = false
