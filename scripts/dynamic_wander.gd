class_name DynamicWander extends Face

var wander_offset: float = 2
var wander_radius: float = 0.5
var wander_rate: float = 0.1
var wander_orientation: float = 0.5
var max_acceleration: float = 0.1

func random_binomial() -> float:
	return randf_range(0, 2)

# Code for the dynamic implementation of the wandering algorithm.
# It wanders along a circle around the target and seeks it.
# Each frame, the character tries to face the target.
func dynamic_wander() -> SteeringOutput:
	var result = SteeringOutput.new()
	
	# Get the wander orientation, as well as the desired orientation
	# and position for the character.
	wander_orientation += random_binomial() * wander_rate
	var desired_orientation = wander_orientation + character.rotation
	var desired_position = character.position + wander_offset * Vector2.from_angle(character.rotation)
	
	# Calculates and sets the desired position.
	desired_position += wander_radius * Vector2.from_angle(desired_orientation)
	character.position = desired_position
	
	# Delegates to face and adds acceleration in the direction of the rotation
	result = face()
	result.linear = max_acceleration * Vector2.from_angle(character.rotation)
	
	return result
