class_name VelocityMatching extends Node

var character: CharacterBody2D
var target: CharacterBody2D
var max_acceleration: float = 0.2
var time_to_target: float = 0.1

func velocity_matching() -> SteeringOutput:
	var result = SteeringOutput.new()
	
	# Calculates the velocity
	result.linear = target.velocity - character.velocity
	result.linear /= time_to_target

	# Check if the acceleration is too fast.
	if result.linear.length() > max_acceleration:
		result.linear.normalized()
		result.linear *= max_acceleration

	result.angular = 0
	return result
