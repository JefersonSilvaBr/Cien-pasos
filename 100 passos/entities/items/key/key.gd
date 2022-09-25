extends ItemTemplate
class_name Key

func _ready():
	Global.have_key = false

func _process(delta):
	if it_is and Input.is_action_just_pressed("ui_accept"):
		Global.have_key = true
		$Coollider.disabled = true
		$Texture.visible = false
		$ColletedFX.play()


func _on_Key_body_entered(body):
	it_is = true

func _on_Key_body_exited(body):
	it_is = false

func _on_ColletedFX_finished():
	queue_free()
