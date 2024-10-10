class_name Align extends Node

@export var character: CharacterBody2D
@export var target: CharacterBody2D

@export var max_angular_acceleration: float = 10
@export var max_rotation: float = 50
@export var target_radius: float = 0.2
@export var slow_radius: float = 1
@export var time_to_target: float = 0.1

func map_to_range(angle: float) -> float:
	return fmod((angle + PI),(2 * PI)) - PI

# tries to align to the direction of the target.
# Returns a SteeringOutput in which the linear value
# has no need.
func align() -> SteeringOutput:
	var result = SteeringOutput.new()
	var target_rotation: float
	
	# naive direction to target. Must be between the [-PI, PI] interval
	var rotation = target.rotation - character.rotation
	rotation = map_to_range(rotation)
	var rotation_size = abs(rotation)
	
	# returns a null result if we are not in that radius
	if rotation_size < target_radius:
		result.angular = 0
		result.linear = Vector2.ZERO
		return result
	
	# if we are outside the slow radius we use the maximum possible rotation
	if rotation_size > slow_radius:
		target_rotation = max_rotation
	else:
		target_rotation = max_rotation * rotation_size / slow_radius
	
	# we combine speed and direction
	target_rotation *= rotation / rotation_size
	
	# we try to get to the target's rotation through acceleration
	result.angular = target_rotation - character.rotation
	result.angular /= time_to_target
	
	# check if the acceleration is too big
	var angular_acceleration = abs(result.angular)
	if angular_acceleration > max_angular_acceleration:
		result.angular /= angular_acceleration
		result.angular *= max_angular_acceleration

	result.linear = Vector2.ZERO
	return result
