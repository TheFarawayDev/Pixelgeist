extends Control

@onready var mainmenuanimation = $AnimatedSprite2D
var timesplayed = 0


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if timesplayed <1:
		mainmenuanimation.play("default")
		$Singleplayer.visible = false
		$Multiplayer.visible = false
		$Options.visible = false
		$Exit.visible = false
	await mainmenuanimation.animation_finished
	$VideoStreamPlayer.paused = false
	timesplayed =1
	$Singleplayer.visible = true
	$Multiplayer.visible = true
	$Options.visible = true
	$Exit.visible = true


func _on_singleplayer_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/test-map.tscn")

func _on_multiplayer_pressed() -> void:
	$Warning.visible = true
	await get_tree().create_timer(.5).timeout
	$Warning.visible = false



func _on_exit_pressed() -> void:
	get_tree().quit()
