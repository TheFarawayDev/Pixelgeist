extends Area2D

@export var target_group: String = ""
@export var sprite_on: Texture2D = preload("res://Assets/Random/power-panel1.png")
@export var sprite_off: Texture2D = preload("res://Assets/Random/power-panel2.png")

@onready var sprite = $Sprite2D

var is_switch_flipped: bool = false

func _ready():
	input_event.connect(_on_input_event)
	GameManager.power_state_changed.connect(_on_global_power_update)
	update_visuals_and_lights()

func _on_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton and event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
		is_switch_flipped = not is_switch_flipped
		update_visuals_and_lights()

func _on_global_power_update(_global_state):
	update_visuals_and_lights()

func update_visuals_and_lights():
	# Update local sprite
	if is_switch_flipped:
		sprite.texture = sprite_on
	else:
		sprite.texture = sprite_off

	# Update lights in the group
	if GameManager.is_power_on and is_switch_flipped:
		get_tree().call_group(target_group, "fade_on")
	else:
		get_tree().call_group(target_group, "snap_off")
