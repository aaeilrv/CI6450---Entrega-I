extends Node

var MAX_SPEED = 0.98

@export var target: CharacterBody2D
@export var visibility: bool

@export var character1: BaseCharacter
@export var character2: BaseCharacter
@export var character3: BaseCharacter
@export var character4: BaseCharacter
@export var character5: BaseCharacter

@export var wanderer1: DynamicWander
@export var wanderer2: DynamicWander
@export var wanderer3: DynamicWander
@export var wanderer4: DynamicWander
@export var wanderer5: DynamicWander

# Call to have five different characters wandering.
# Has no implementation of the algorithm. For that, go to dynamic_wander.gd
func _ready() -> void:
	target = get_parent().get_node("player")
	
	character1 = BaseCharacter.new()
	character1.character = get_node("wanderer1")
	
	character2 = BaseCharacter.new()
	character2.character = get_node("wanderer2")
	
	character3 = BaseCharacter.new()
	character3.character = get_node("wanderer3")
	
	character4 = BaseCharacter.new()
	character4.character = get_node("wanderer4")
	
	character5 = BaseCharacter.new()
	character5.character = get_node("wanderer5")
	
	if visibility:
		ready_visible()
	else:
		$wanderer1.visible = false
		$wanderer2.visible = false
		$wanderer3.visible = false
		$wanderer4.visible = false
		$wanderer5.visible = false
	
func _process(delta: float) -> void:
	if visibility:
		process_visible(delta)
	
func ready_visible() -> void:	
	wanderer1 = DynamicWander.new()
	wanderer1.explicit_target = target
	wanderer1.character = character1.character
	
	wanderer2 = DynamicWander.new()
	wanderer2.explicit_target = target
	wanderer2.character = character2.character
	
	wanderer3 = DynamicWander.new()
	wanderer3.explicit_target = target
	wanderer3.character = character3.character
	
	wanderer4 = DynamicWander.new()
	wanderer4.explicit_target = target
	wanderer4.character = character4.character
	
	wanderer5 = DynamicWander.new()
	wanderer5.explicit_target = target
	wanderer5.character = character5.character
	
func process_visible(delta: float) -> void:
	var result1 = wanderer1.dynamic_wander()
	var result2 = wanderer2.dynamic_wander()
	var result3 = wanderer3.dynamic_wander()
	var result4 = wanderer4.dynamic_wander()
	var result5 = wanderer5.dynamic_wander()
	
	character1.update(result1, MAX_SPEED, delta)
	character2.update(result2, MAX_SPEED, delta)
	character3.update(result3, MAX_SPEED, delta)
	character4.update(result4, MAX_SPEED, delta)
	character5.update(result5, MAX_SPEED, delta)
