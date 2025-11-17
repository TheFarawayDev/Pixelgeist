#TheFarawayDev Was Somewhere!
#no he wasn't

extends CharacterBody2D

@export var speed: float = 300.0

func _physics_process(delta: float) -> void:
	var input_direction: Vector2 = Input.get_vector("left", "right", "up", "down")

	if input_direction != Vector2.ZERO:
		velocity = input_direction.normalized() * speed
	else:
		velocity = Vector2.ZERO
	

	move_and_slide()


func _on_check_button_toggled(toggled_on: bool) -> void:
	if toggled_on == true:
		$Camera2D/lighting.color.a = 0
	else:
		$Camera2D/lighting.color.a = .5
