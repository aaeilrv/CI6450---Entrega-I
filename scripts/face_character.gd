class_name FaceCharacter extends BaseCharacter

@export var target: CharacterBody2D
@export var face_call: Node

func _ready() -> void:
	target = get_parent().get_parent().get_node("player")
	face_call = Face.new()
	face_call.explicit_target = target
	face_call.character = character
	
func _process(delta: float) -> void:
	print("hey")
	var result = face_call.face()
	update(result, MAX_SPEED, delta)
	move_and_slide()
