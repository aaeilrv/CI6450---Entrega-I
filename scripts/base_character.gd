class_name BaseCharacter extends CharacterBody2D

@export var character: CharacterBody2D
var MAX_SPEED = 1

# Base class of all used characters. Has update function
# and MAX_SPEED
func update(steering, maxSpeed, delta) -> void:
	character.position += character.velocity * delta
	character.rotation += character.rotation * delta
	
	if steering == null:
		character.velocity = Vector2(0, 0)
		character.rotation = 0
	else:
		if steering is KinematicSteeringOutput:
			character.velocity += steering.velocity * delta
			character.rotation += steering.rotation * delta
		elif steering is SteeringOutput:
			character.velocity += steering.linear * delta
			character.rotation += steering.angular * delta
	
	if velocity.length() > maxSpeed:
		character.velocity.normalized()
		character.velocity *= maxSpeed
