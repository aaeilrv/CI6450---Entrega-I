class_name DynamicFlee extends Node

var target: CharacterBody2D
var character: CharacterBody2D
var max_acceleration: float = 4
var radius: float = 150

# Function for the dynamic flee algorithm.
# It flees from the target as fast as possible while accelerating.
# Returns a SteeringOutput which has no use for the angular result.
func dynamic_flee() -> SteeringOutput:
	var result = SteeringOutput.new()
	
	# Get the direction from the target.
	result.linear = character.position - target.position
	
	if result.linear.length() > radius:
		return null
	
	# The velocity is along this direction, at full speed.
	result.linear.normalized()
	result.linear *= max_acceleration
		
	result.angular = 0
	return result
