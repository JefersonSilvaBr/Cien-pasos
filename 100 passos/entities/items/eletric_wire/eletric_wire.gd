extends Area2D

func _process(delta):
	if $Animated.frame == 0 or $Animated.frame == 3:
		$Collision.disabled = false
		$Light.visible = true
	else:
		$Collision.disabled = true
		$Light.visible = false


func _on_ElectricWire_body_entered(body):
	if body.name == "Player":
		Global.current_state = Global.LOOP
