extends Node

func _ready():
	# Connect once at startup
	GameManager.hunting_state_changed.connect(_on_global_hunting_update) 

func _process(delta: float) -> void:
	# Handle input every frame
	if Input.is_action_just_pressed("toggle_hunt"):
		# This now calls the new toggle_hunting() in GameManager
		GameManager.toggle_hunting() 

func _on_global_hunting_update(is_hunting: bool) -> void:
	if is_hunting:
		print("Hunting mode ON") 
	else:
		print("Hunting mode OFF")
