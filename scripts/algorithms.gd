class_name Algorithm extends Node

@export var selected_algorithm : ALGORITHMS = ALGORITHMS.dynamic_seek

enum ALGORITHMS {
	dynamic_seek,
	dynamic_arrive,
	dynamic_flee,
	kinematic_seek,
	kinematic_arrive,
	kinematic_flee,
	kinematic_wander,
	velocity_matching,
	pursue,
	evade,
	none
}

func new_orientation(current: float, velocity) -> float:
	if velocity.length() > 0:
		return atan2(-velocity.x, velocity.y)
	else:
		return current
