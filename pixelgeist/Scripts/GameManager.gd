extends Node

# 1. The Signal (The notification system)
signal power_state_changed(is_active)

# 2. The Global Variable (The Main True/False)
var is_power_on: bool = false

# 3. Function to change the state safely
func set_power_state(new_state: bool):
	is_power_on = new_state
	# Shout out to the rest of the game that power changed
	power_state_changed.emit(is_power_on)
	print("Global Power State: ", is_power_on)
