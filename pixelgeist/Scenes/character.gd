extends CharacterBody2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Movement
func _process(_delta: float) -> void:
	if Input.is_action_pressed("left"):
		$".".position.x -=10
		#animation
		await get_tree().create_timer(.2).timeout
	if Input.is_action_pressed("right"):
		$".".position.x +=10
		#animation
		await get_tree().create_timer(.2).timeout
	if Input.is_action_pressed("down"):
		#animation
		$".".position.y +=10
		await get_tree().create_timer(.2).timeout
	if Input.is_action_pressed("up"):
		#animation
		$".".position.y -=10
		await get_tree().create_timer(.2).timeout
