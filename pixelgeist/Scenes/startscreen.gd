extends Control


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
<<<<<<< Updated upstream
	pass # Replace with function body.




func _on_video_stream_player_finished() -> void:
	get_tree().change_scene_to_file("res://Scenes/test-map.tscn")
=======
	if timesplayed <1:
		mainmenuanimation.play("default")
	await mainmenuanimation.animation_finished
	$VideoStreamPlayer.paused = false
	timesplayed =1
>>>>>>> Stashed changes
