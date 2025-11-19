extends PointLight2D

func _process(_delta):
	# Check if the action defined in Step 1 was just pressed
	if Input.is_action_just_pressed("toggle_light"):
		# If energy is 0, turn it on (0.4). Otherwise, turn it off (0).
		if energy == 0:
			energy = 0.4
		else:
			energy = 0
