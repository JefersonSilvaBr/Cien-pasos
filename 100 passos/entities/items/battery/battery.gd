extends ItemTemplate

func _ready():
	Global.have_battery = false

func _process(delta):
	if it_is and Input.is_action_just_pressed("ui_accept"):
		Global.have_battery = true
		$Collider.disabled = true
		$Animated.visible = false
		$ColletedFX.play()

func _on_Battery_body_entered(body):
	it_is = true

func _on_Battery_body_exited(body):
	it_is = false


func _on_ColletedFX_finished():
	queue_free()
