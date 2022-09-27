extends Node2D

onready var player_ref = get_parent()
onready var animated = get_parent().get_node("Animated")

func _process(delta):
	if player_ref.limit_steps > 10:
		_play_steps(10)
	elif player_ref.limit_steps == 10:
		_play_steps(0)
	elif player_ref.limit_steps == 9:
		_play_steps(1)
	elif player_ref.limit_steps == 8:
		_play_steps(2)
	elif player_ref.limit_steps == 7:
		_play_steps(3)
	elif player_ref.limit_steps == 6:
		_play_steps(4)
	elif player_ref.limit_steps == 5:
		_play_steps(5)
	elif player_ref.limit_steps == 4:
		_play_steps(6)
	elif player_ref.limit_steps == 3:
		_play_steps(7)
	elif player_ref.limit_steps == 2:
		_play_steps(8)
	elif player_ref.limit_steps == 1:
		_play_steps(9)
	elif player_ref.limit_steps == 0:
		_play_steps(9)

func _play_steps(index):
	if (animated.animation == "walk" or animated.animation == "walk_2") and not get_parent().final:
		if animated.frame == 2:
			get_child(index).play()
