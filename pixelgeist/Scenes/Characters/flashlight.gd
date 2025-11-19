extends PointLight2D

# A variable to hold the Tween node reference
var light_tween: Tween = null
# Define the fade-out duration
const FADE_DURATION: float = 0.5 

func _ready():
	# Create a new Tween node when the light is ready to use
	# We'll create it here and reuse it to avoid creating new nodes constantly
	light_tween = create_tween()
	# The light should start off (or at a default state)
	energy = 0
	# Stop the tween to prevent it from running before the first press
	light_tween.stop()

func _process(_delta):
	# Check if the action defined in Step 1 was just pressed
	if Input.is_action_just_pressed("toggle_light"):
		# If the light is currently OFF (energy is 0 or very close to it)
		if is_equal_approx(energy, 0.0):
			# 1. INSTANT CLICK ON: Stop any ongoing tween and set energy immediately.
			light_tween.stop()
			energy = 0.4
		else:
			# 2. SLOW FADE OUT: Create a new tween sequence to smoothly transition the energy to 0.
			
			# It's good practice to stop any previous tweens if you are reusing the variable.
			# Although we stopped it on "on," stopping it here too is safer for complex logic.
			light_tween.stop()
			
			# Start a new tween to fade the 'energy' property of this node (self) 
			# from its current value to 0.0 over FADE_DURATION seconds.
			light_tween = create_tween()
			light_tween.tween_property(self, "energy", 0.0, FADE_DURATION)
			
			# OPTIONAL: You can change the easing curve for a different fade feel.
			# light_tween.set_ease(Tween.EASE_OUT).set_trans(Tween.TRANS_QUAD)
