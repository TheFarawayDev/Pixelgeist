extends PointLight2D

@export var fade_duration: float = 2.0
@export var target_energy: float = 1.0
@export var specific_color: Color = Color("ffbe94")

var current_tween: Tween

func _ready():
	color = specific_color
	
	# 1. Connect to the GameManager signal
	# This ensures the light reacts when the switch is flipped later
	GameManager.power_state_changed.connect(_on_global_power_update)
	
	# 2. Initial State Check
	# This ensures the light is correct if the scene loads and power is ALREADY on
	_on_global_power_update(GameManager.is_power_on)

# This function runs whenever the GameManager signal fires
func _on_global_power_update(is_on: bool):
	if is_on:
		fade_on()
	else:
		snap_off()

# --- Visual Logic (Same as before) ---

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
