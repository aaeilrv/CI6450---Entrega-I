class_name KinematicSeek extends Algorithm

var target: CharacterBody2D
var character: CharacterBody2D
var max_speed: float = 0.1

# Kinematic implementation of the seek algorithm.
func kinematic_seek() -> KinematicSteeringOutput:
	var result = KinematicSteeringOutput.new()
	
	# Calculates the velocity the character must seek at.
	result.velocity = target.position - character.position
	
	result.velocity.normalized()
	result.velocity *= max_speed
	
	# Obtains rotation in the naive method
	character.rotation = new_orientation(
		character.rotation,
		result.velocity
	)
		
	result.rotation = 0
	return result
