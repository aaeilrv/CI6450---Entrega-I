extends Node

var MAX_SPEED = 0.98

@export var target: CharacterBody2D
@export var pursuer: BaseCharacter
@export var evader: BaseCharacter

@export var pursue_algorithm: Pursue
@export var evade_algorithm: Evade

func _ready() -> void:
	var player = get_parent().get_node("player")
	var pursuer_character = get_node("Pursuer")
	#var character_two = get_node("Evader")
	
	var pursuer = BaseCharacter.new()
	pursuer.character = pursuer_character
	
	pursue_algorithm = Pursue.new()
	pursue_algorithm.new_target = target
	pursue_algorithm.character = pursuer_character

func _process(delta: float) -> void:
	var result = pursue_algorithm.pursue()
	pursuer.update(result, MAX_SPEED, delta)	
