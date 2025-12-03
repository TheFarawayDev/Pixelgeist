extends PointLight2D

@export var fade_duration: float = 2.0
@export var target_energy: float = 1.0
@export var specific_color: Color = Color("ffbe94")
@export var hunting_color: Color = Color("cc0006ff")

var current_tween: Tween

func _ready():
	color = specific_color
	
	GameManager.hunting_state_changed.connect(_on_global_hunting_update)

func _on_global_hunting_update(is_hunting: bool):
	if is_hunting:
		color = hunting_color
	else:
		color = specific_color

func snap_off():
	if current_tween: current_tween.kill()
	energy = 0.0

func fade_on():
	# Check if already at max energy to avoid restarting animation unnecessarily
	if is_equal_approx(energy, target_energy): return
	
	if current_tween: current_tween.kill()
	current_tween = create_tween()
	current_tween.tween_property(self, "energy", target_energy, fade_duration)\
		.set_trans(Tween.TRANS_SINE).set_ease(Tween.EASE_OUT)
