class_name wandering_being extends CharacterBody2D

@export var kinematic_wandering: Node
var orientation: float 
var MAX_SPEED = 0.5

func _process(delta: float) -> void:
	kinematic_wandering_call(delta)
	var direction = Vector2(0, 1).rotated(rotation)

func _ready() -> void:
	orientation = new_orientation(0, velocity)
	kinematic_wandering = KinematicWandering.new()
	kinematic_wandering.max_speed = 1000
	kinematic_wandering.max_rotation = 20
	kinematic_wandering.character = get_parent().get_node("wanderer")

func kinematic_wandering_call(delta) -> void:
	var results = kinematic_wandering.kinematic_wander()
	update(results, MAX_SPEED, delta)

func update(steering, maxSpeed, time) -> void:
	# Update the position and orientation.\
	position += velocity * time
	orientation += rotation * time
	
	# and the velocity and rotation.
	if steering == null:
		velocity = Vector2(0, 0)
		rotation = 0
	else:
		velocity += steering.velocity * time
		rotation += steering.rotation * time
	
	# Check for speeding and clip.
	if velocity.length() > maxSpeed:
		velocity.normalized()
		velocity *= maxSpeed
		
func new_orientation(current, velocity) -> float:
	if velocity.length() > 0:
		return atan2(-position.x, position.y)
	else:
		return current
