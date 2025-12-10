extends Control

#This part if what allows us to edit values of nodes in the project.
@onready var singleplayer = $Singleplayer
@onready var multiplayerc = $Multiplayer
@onready var optionsc = $Options_Credits
@onready var quitc = $Quit





#Variables for if statements.
var on_off = 0
var times_played = 0
#Remote movement variables
var row = 4
var isfullscreen = false





#This gets the scene ready when it is initiated
func _ready() -> void:
	singleplayer.visible = false
	multiplayerc.visible = false
	optionsc.visible = false
	quitc.visible = false

#The delta function below is a forever loop, while there is no gravity in the project it is needed for other functions to loop
func _process(delta: float) -> void:
	pass

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
