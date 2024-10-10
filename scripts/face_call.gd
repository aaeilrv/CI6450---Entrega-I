extends Node

var MAX_SPEED = 0.98

@export var target: CharacterBody2D
@export var visibility: bool

@export var character1: BaseCharacter
@export var character2: BaseCharacter
@export var character3: BaseCharacter
@export var character4: BaseCharacter
@export var character5: BaseCharacter

@export var face1: Face
@export var face2: Face
@export var face3: Face
@export var face4: Face
@export var face5: Face

# Call to get give facing characters.
# For the implementation of the algorithm, go to face.gc
func _ready() -> void:
	target = get_parent().get_node("player")
	
	character1 = BaseCharacter.new()
	character1.character = get_node("face1")
	
	character2 = BaseCharacter.new()
	character2.character = get_node("face2")
	
	character3 = BaseCharacter.new()
	character3.character = get_node("face3")
	
	character4 = BaseCharacter.new()
	character4.character = get_node("face4")
	
	character5 = BaseCharacter.new()
	character5.character = get_node("face5")
	
	if visibility:
		ready_visible()
	else:
		$face1.visible = false
		$face2.visible = false
		$face3.visible = false
		$face4.visible = false
		$face5.visible = false

func _process(delta: float) -> void:
	if visibility:
		process_visible(delta)
		
func process_visible(delta: float) -> void:
	var result1 = face1.face()
	var result2 = face2.face()
	var result3 = face3.face()
	var result4 = face4.face()
	var result5 = face5.face()
	
	character1.update(result1, MAX_SPEED, delta)
	character2.update(result2, MAX_SPEED, delta)
	character3.update(result3, MAX_SPEED, delta)
	character4.update(result4, MAX_SPEED, delta)
	character5.update(result5, MAX_SPEED, delta)

func ready_visible() -> void:
	face1 = Face.new()
	face1.explicit_target = target
	face1.character = character1.character
	
	face2 = Face.new()
	face2.explicit_target = target
	face2.character = character2.character
	
	face3 = Face.new()
	face3.explicit_target = target
	face3.character = character3.character
	
	face4 = Face.new()
	face4.explicit_target = target
	face4.character = character4.character
	
	face5 = Face.new()
	face5.explicit_target = target
	face5.character = character5.character
