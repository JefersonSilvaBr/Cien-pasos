extends KinematicBody2D
class_name CharTemplate

var is_true

var current_state = 0
enum {BASE, INTERACTION}

func _ready():
	$TextController.set_process(false)

func _process(delta):
	match current_state:
		BASE:
			_base()
		INTERACTION:
			_interaction()

func _base():
	$TextController.visible = false
	current_state = _base_check()

func _interaction():
	$TextController.set_process(true)
	$TextController.visible = true

func _base_check():
	if is_true and Input.is_action_just_pressed("ui_accept"):
		$TextController/additional._controler()
		return INTERACTION
	return current_state

func _interaction_check():
	$TextController.set_process(false)
	$CheckInteraction/Collider.disabled = true
	$CheckInteraction/Collider.disabled = false
	current_state = BASE


func _on_TextController_end_dialog():
	_interaction_check()

func _on_CheckInteraction_body_entered(body):
	if body.name == "Player":
		is_true = true

func _on_CheckInteraction_body_exited(body):
	if body.name == "Player":
		is_true = false
