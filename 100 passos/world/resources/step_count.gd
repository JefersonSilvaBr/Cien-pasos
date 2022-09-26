extends Node2D

func _on_Notifier_screen_exited():
	$Text.text = str(Global.step_counter)
