extends KinematicBody2D

var it_is 
export(bool) var closed

func _process(delta):
	if closed and it_is and Global.have_key and Input.is_action_just_pressed("ui_accept"):
		$SoundFX/UnlockingFX.play()
		$SoundFX/OpenFX.play()
		$Collider.disabled = true
		$Check_interaction/Collider.disabled = true
		$Animated.play("open")
		Global.have_key = false
	elif Input.is_action_just_pressed("ui_accept") and it_is and closed == false:
		$SoundFX/OpenFX.play()
		$Collider.disabled = true
		$Check_interaction/Collider.disabled = true
		$Animated.play("open")
	else:
		$SoundFX/LockedFX.play()

func _on_Check_interaction_body_entered(body):
	it_is = true
	
func _on_Check_interaction_body_exited(body):
	it_is = false
