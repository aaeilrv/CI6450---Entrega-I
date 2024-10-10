class_name DynamicSeek extends Node

var target: CharacterBody2D
var character: CharacterBody2D
var max_acceleration: float = 0.5

# Tries to match the position of the target with acceleration.
# Returns a SteeringOutput with no use for its linear value.
func dynamic_seek() -> SteeringOutput:
	# Calculates position from target.
	var result = SteeringOutput.new()
	result.linear = target.position - character.position
	
	# Gives full acceleration to get to the target.
	result.linear.normalized()
	result.linear *= max_acceleration
		
	result.angular = 0
	return result
