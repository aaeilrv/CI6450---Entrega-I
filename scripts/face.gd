class_name Face extends Align

@export var explicit_target: CharacterBody2D

# Implementation of the face algorithm.
# Makes a character look at its target. It does so by calculating
# the target's orientation and delegating the rotation job to Align.
func face() -> SteeringOutput:
	# calculates the direction
	var direction = explicit_target.position - character.position
	max_angular_acceleration = 20
	max_rotation = 20
	target_radius = 0.1
	slow_radius = 10
	time_to_target = 1
	
	if direction.length() == 0:
		return null
	
	# Sets the values to call align.
	target = explicit_target
	character.rotation = atan2(
		-direction.x,
		direction.y
	)
	
	return align()
