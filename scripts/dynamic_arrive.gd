class_name DynamicArrive extends Node

var target: CharacterBody2D
var character: CharacterBody2D
var max_acceleration: float = 1
var max_speed: float = 0.5
var target_radius: float = 50
var slow_radius: float = 60
var time_to_target: float = 0.25

# Function for the dynamic implementation of the arrive algorithm.
# Runs dynamically to the target and stops when its at the target_radius.
# Returns a SteeringOutput in which the angular value has no relevant use.
func dynamic_arrive() -> SteeringOutput:
	var result = SteeringOutput.new()
	var desired_target_speed: float
	var desired_target_velocity: Vector2
	
	# Get the direction to the target.
	var direction = target.position - character.position
	var distance = direction.length()
	
	# Returns null if the distance is smaller than the radius.
	if distance < target_radius:
		return null
	
	# If we are outside the slow radius, move at max speed.
	# Otherwise, calculates a scaled speed.
	if distance > slow_radius:
		desired_target_speed = max_speed
	else:
		desired_target_speed = max_speed * distance / slow_radius
	
	# the target velocity combines speed and direction.
	desired_target_velocity = direction
	desired_target_velocity.normalized()
	desired_target_velocity *= desired_target_speed
	
	# Uses acceleration.
	result.linear = desired_target_velocity - character.velocity
	result.linear /= time_to_target
	
	# Checks if the acceleration is too fast. If such, calculates
	# a scaled acceleration.
	if result.linear.length() > max_acceleration:
		result.linear.normalized()
		result.linear *= max_acceleration
	
	result.angular = 0
	return result
