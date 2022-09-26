extends Node2D

func _ready():
	TransitionLevel.get_node("SoundFX/SoundScapeFX").play()
