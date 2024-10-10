class_name Evade extends DynamicFlee

@export var max_prediction: float
@export var new_target: CharacterBody2D

# Implementation of the evade algorithm.
# It tries to predict the position of the target to evade it. 
func evade() -> SteeringOutput:
	
	# gets regular distance from the target
	var direction = new_target.position - character.position
	var distance = direction.length()
	var speed = new_target.velocity.length()
	var prediction: float = 0
	
	# estimates a prediction time 
	if speed <= distance / max_prediction:
		prediction -= max_prediction
	else:
		prediction = distance / speed
	
	# Put the target together.		
	# We use this variable to store the current position of our target.
	# We do this since, when we assign target.position for our dynamic_flee call,
	# as to predict the target's new possition, we are also changing our current
	# target's position, which we don't want. So after the asignation with re-assign
	# it with it's actual position
	target = new_target
	var new_target_position = new_target.position
	target.position = new_target.velocity  * prediction
	new_target.position = new_target_position
	
	return dynamic_flee()
