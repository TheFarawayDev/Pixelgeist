extends PointLight2D

# A variable to hold the Tween node reference
var light_tween: Tween = null
# Define the fade-out duration
const FADE_DURATION: float = 0.5 

func _ready():

	light_tween = create_tween()

	energy = 0

	light_tween.stop()

func _process(_delta):

	if Input.is_action_just_pressed("toggle_light"):

		if is_equal_approx(energy, 0.0):

			light_tween.stop()
			energy = 0.4
		else:
			light_tween.stop()
			
			light_tween = create_tween()
			light_tween.tween_property(self, "energy", 0.0, FADE_DURATION)
