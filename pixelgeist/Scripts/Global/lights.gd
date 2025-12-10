extends Sprite2D

@export var fade_duration: float = 2.0
@export var target_energy: float = 1.0
@export var specific_color: Color = Color("ffbe94")
@export var hunting_color: Color = Color("cc0006ff")

@export var texture_on: Texture2D
@export var texture_off: Texture2D

var current_tween: Tween
@onready var point_light: PointLight2D = $"source"  # Ensure exact, case‑sensitive child name

func _ready():
	# If you rely on groups, add this node to the correct group here.
	# add_to_group("mary-lane-liv-lights")
	if point_light == null:
		push_error("Child PointLight2D 'Source' not found under Sprite2D.")
		return
	point_light.color = specific_color
	point_light.energy = 0.0
	texture = texture_off

func snap_off():
	if current_tween:
		current_tween.kill()
	if point_light:
		point_light.energy = 0.0
	texture = texture_off

func fade_on():
	if point_light == null:
		push_error("Child PointLight2D 'Source' not found under Sprite2D.")
		return

	if is_equal_approx(point_light.energy, target_energy):
		texture = texture_on  # keep sprite in sync even if already at target
		return

	if current_tween:
		current_tween.kill()

	current_tween = create_tween()
	current_tween.tween_property(point_light, "energy", target_energy, fade_duration) \
		.set_trans(Tween.TRANS_SINE).set_ease(Tween.EASE_OUT)

	texture = texture_on
