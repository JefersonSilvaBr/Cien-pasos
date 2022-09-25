extends Area2D

var it_is : bool

func _process(delta):
	if ($Animated.frame == 11 or $Animated.frame == 5) and it_is:
		$SoundCheck/EletricFX.play()
	if ($Animated.frame == 0 or $Animated.frame == 1 or $Animated.frame == 6 or $Animated.frame == 7):
		$Collision.disabled = false
		$Light.visible = true
	else:
		$Collision.disabled = true
		$Light.visible = false

func _on_ElectricWire_body_entered(body):
	if body.name == "Player":
		Global.current_state = Global.LOOP

func _on_SoundCheck_body_entered(body):
	it_is = true

func _on_SoundCheck_body_exited(body):
	it_is = false
