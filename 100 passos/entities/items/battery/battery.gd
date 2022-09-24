extends ItemTemplate

func _ready():
	Global.have_battery = false

func _process(delta):
	if it_is and Input.is_action_just_pressed("ui_accept"):
		Global.have_battery = true
		queue_free()

func _on_Battery_body_entered(body):
	it_is = true

func _on_Battery_body_exited(body):
	it_is = false
