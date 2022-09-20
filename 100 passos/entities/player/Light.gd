extends Light2D

var type = 0

func _physics_process(delta):
	if type == 0:
		if texture_scale < 1:
			texture_scale += 0.0001
		else:
			type = 1
	elif type == 1:
		if texture_scale > 0.99:
			texture_scale -= 0.0001

		else:
			type = 0
