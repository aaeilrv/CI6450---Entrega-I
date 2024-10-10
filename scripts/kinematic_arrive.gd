class_name KinematicArrive extends Algorithm

var target: CharacterBody2D
var character: CharacterBody2D
var max_speed: float = 0.1
var radius: float = 50
var time_to_target: float = 0.25

# Kinematic implementation of the arrive algorithm.
func kinematic_arrive() -> KinematicSteeringOutput:
	var result = KinematicSteeringOutput.new()
	
	# Calculates the velocity through the positions.
	result.velocity = target.position - character.position
	
	if result.velocity.length() < radius:
		return null
		
	# Tries to get to the target in time_to_target seconds.
	result.velocity /= time_to_target
	
	# Clips to max speed if the velocity is too fast.
	if result.velocity.length() > max_speed:
		result.velocity.normalized()
		result.velocity *= max_speed
	
	# calculates new orientation in naive method.
	character.rotation = new_orientation(
		character.rotation,
		result.velocity
	)
	
	result.rotation = 0
	return result
