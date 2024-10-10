class_name KinematicWandering extends Node

var character: CharacterBody2D
var max_speed: float = 10
var max_rotation: float = 2

func random_binomial() -> float:
	return randf_range(0, 2)

# Kinematic implementation of the wandering algorithm.
# Always moves at the character's current orientation with maximum speed.
func kinematic_wander() -> KinematicSteeringOutput:
	var result = KinematicSteeringOutput.new()
	
	# Gets the velocity from the vector form of the character's orientation
	# (in Godot, orientation = rotation)
	result.velocity = max_speed * Vector2.from_angle(character.rotation)
	
	# Change rotation randomly
	result.rotation = - random_binomial() * max_rotation
	
	return result
