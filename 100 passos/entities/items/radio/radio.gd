extends ItemTemplate
class_name Radio

var destroid

func _ready():
	Global.have_radio = false

func _process(delta):
	if destroid and Input.is_action_just_pressed("ui_accept"):
		queue_free()
	elif it_is and Input.is_action_just_pressed("ui_accept") and $Animated.visible:
		if Global.have_battery == false:
			$TextBox.visible = true
		Global.have_radio = true
		$Collider.disabled = true
		$Animated.visible = false
		$ColletedFX.play()

func _on_Radio_body_entered(body):
	it_is = true

func _on_Radio_body_exited(body):
	it_is = false

func _on_ColletedFX_finished():
	destroid = true
