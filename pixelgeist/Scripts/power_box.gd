extends Area2D

# ERROR FIX: Use 'preload' to load specific files by their path
# We don't need '@export' anymore because we are hard-coding the paths here.
var sprite_on = preload("res://Assets/Random/power-panel1.png")
var sprite_off = preload("res://Assets/Random/power-panel2.png")

@onready var sprite = $Sprite2D

func _ready():
	input_event.connect(_on_input_event)
	GameManager.power_state_changed.connect(_update_visuals)
	_update_visuals(GameManager.is_power_on)

func _on_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton and event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
		GameManager.set_power_state(not GameManager.is_power_on)

func _update_visuals(is_on: bool):
	if is_on:
		sprite.texture = sprite_on
	else:
		sprite.texture = sprite_off
