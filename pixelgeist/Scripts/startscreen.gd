extends Control

#For changing the color of labels cause of stuff
@onready var singleplayer = $Singleplayer
@onready var multiplayerc = $Multiplayer
@onready var optionsc = $Options_Credits
@onready var quitc = $Quit
@onready var camera = $Camera2D




@onready var video = $Screen
var on_off = 0
var times_played = 0
#Remote movement variables
var row = 4
var isfullscreen = false






func _ready() -> void:
	singleplayer.visible = false
	multiplayerc.visible = false
	optionsc.visible = false
	quitc.visible = false
	video.visible =false

func _process(delta: float) -> void:
	if isfullscreen == false:
		camera.zoom.x = 1
		camera.zoom.y = 1
	elif isfullscreen == true:
		camera.zoom.x = 2.5
		camera.zoom.y = 2.5
	if row == 4:
		singleplayer.modulate = Color("00FF00")
		multiplayerc.modulate = Color("009c00")
		optionsc.modulate = Color("009c00")
		quitc.modulate = Color("009c00")
	elif row == 3:
		singleplayer.modulate = Color("009c00")
		multiplayerc.modulate = Color("00FF00")
		optionsc.modulate = Color("009c00")
		quitc.modulate = Color("009c00")
	elif row == 2:
		singleplayer.modulate = Color("009c00")
		multiplayerc.modulate = Color("009c00")
		optionsc.modulate = Color("00FF00")
		quitc.modulate = Color("009c00")
	else:
		singleplayer.modulate = Color("009c00")
		multiplayerc.modulate = Color("009c00")
		optionsc.modulate = Color("009c00")
		quitc.modulate = Color("00FF00")








func _on_up_button_pressed() -> void:
	if row < 4:
		row +=1
func _on_down_button_pressed() -> void:
	if row >0:
		row-=1
func _on_left_button_pressed() -> void:
	pass # Replace with function body.
func _on_right_button_pressed() -> void:
	pass # Replace with function body.
func _on_confirm_button_pressed() -> void:
	if row == 4:
		get_tree().change_scene_to_file("res://Scenes/test-map.tscn")
	elif row == 3:
		print("Multiplayer")
	elif row == 2:
		print("Options")
	else:
		get_tree().quit()
func _on_power_button_pressed() -> void:
	if on_off == 0:
		row = 4
		on_off = 1
		times_played = 0
		$Screen.visible = true
		video.play("MenuStartup")
		times_played =1
		await get_tree().create_timer(1).timeout
		if on_off == 1:
			singleplayer.visible = true
			multiplayerc.visible = true
			optionsc.visible = true
			quitc.visible = true
		#put the button variable stuff here
	else:
		on_off = 0
		singleplayer.visible = false
		multiplayerc.visible = false
		optionsc.visible = false
		quitc.visible = false
		$Screen.visible = false
