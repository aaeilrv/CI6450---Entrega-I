class_name KinematicFlee extends Algorithm

var target: CharacterBody2D
var character: CharacterBody2D
var max_speed: float = 0.5

# Kinematic implementation of the flee algorithm.
func kinematic_flee() -> KinematicSteeringOutput:
	var result = KinematicSteeringOutput.new()
	
	# Calculates the velocity the character must flee at
	result.velocity = character.position - target.position
	
	result.velocity.normalized()
	result.velocity *= max_speed

	# Calculates rotation in the naive method.
	character.rotation = new_orientation(
		character.rotation,
		result.velocity
	)
	
	result.rotation = 0
	
	return result
