#TheFarawayDev Was Somewhere!

extends CharacterBody2D

@export var speed: float = 300.0

func _physics_process(delta: float) -> void:
	var input_direction: Vector2 = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")

	if input_direction != Vector2.ZERO:
		velocity = input_direction.normalized() * speed
	else:
		velocity = Vector2.ZERO

	move_and_slide()
