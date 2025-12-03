extends Node

signal power_state_changed(is_active)
signal hunting_state_changed(is_active)

var is_power_on: bool = false
var is_hunting: bool = false

func set_power_state(new_state: bool):
	is_power_on = new_state
	power_state_changed.emit(is_power_on)
	print("Global Power State: ", is_power_on)
	
func set_hunting_state(new_state: bool):
	is_hunting = new_state
	hunting_state_changed.emit(is_hunting)
	print("Global Hunting State: ", is_hunting)
	
