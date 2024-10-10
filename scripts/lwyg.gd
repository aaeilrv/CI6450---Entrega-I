class_name LWYG extends Align

func look_where_youre_going() -> SteeringOutput:
	var result = SteeringOutput.new()
	
	# Check for a zero direction and makes no change if so.
	var velocity = character.velocity
	
	if velocity.length() == 0:
		result.linear = Vector2.ZERO
		result.angular = 0
		return result
	
	# Otherwise, set the target based on the velocity
	target.rotation = atan2(-velocity.x, velocity.y)
	return align()
