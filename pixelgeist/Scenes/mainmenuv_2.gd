extends Node2D

@onready var tv = $Tv
var tvon = false



# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass



#This makes my life easier 
func _on_onbutton_1_pressed() -> void:
	if tvon == false:
		tv.play("on")
		tvon = true
	elif tvon == true:
		tv.play("off")
		tvon = false
func _on_onbutton_2_pressed() -> void:
	if tvon == false:
		tv.play("on")
		tvon = true
	elif tvon == true:
		tv.play("off")
		tvon = false
