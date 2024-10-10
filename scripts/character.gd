class_name game_character extends BaseCharacter

@export var algorithm: Algorithm.ALGORITHMS
@export var align: bool
@export var lwyg: bool

@export var rotation_speed: float = 2
@export var orientation = 0

@export var target: CharacterBody2D
var selected_algorithm: Node

# Character destined for the dynamic and kinematic
# algorithms. To use it, select in the right panel
# at the Godot app the desired algorithm to use.
func _ready() -> void:
	if algorithm == Algorithm.ALGORITHMS.none:
		$".".visible = false
		pass
	else:
		has_selection()

func has_selection() -> void:
	var has_target: bool = true
	target = get_parent().get_node("player")
	print(target)
	character = get_parent().get_node("character")
	
	match algorithm:
		Algorithm.ALGORITHMS.kinematic_seek:
			selected_algorithm = KinematicSeek.new()
		Algorithm.ALGORITHMS.kinematic_arrive:
			selected_algorithm = KinematicArrive.new()
		Algorithm.ALGORITHMS.kinematic_flee:
			selected_algorithm = KinematicFlee.new()
		Algorithm.ALGORITHMS.kinematic_wander:
			selected_algorithm = KinematicWandering.new()
			has_target = false
		Algorithm.ALGORITHMS.dynamic_seek:
			selected_algorithm = DynamicSeek.new()
		Algorithm.ALGORITHMS.dynamic_arrive:
			selected_algorithm = DynamicArrive.new()
		Algorithm.ALGORITHMS.dynamic_flee:
			selected_algorithm = DynamicFlee.new()
		Algorithm.ALGORITHMS.velocity_matching:
			selected_algorithm = VelocityMatching.new()
		Algorithm.ALGORITHMS.pursue:
			selected_algorithm = Pursue.new()
			selected_algorithm.new_target = target
			has_target = false
		Algorithm.ALGORITHMS.evade:
			selected_algorithm = Evade.new()
			selected_algorithm.new_target = target
			has_target = false
			
	if has_target:
		selected_algorithm.target = target
	selected_algorithm.character = character
	
func _process(delta: float) -> void:
	if algorithm == Algorithm.ALGORITHMS.none:
		pass
	else:
		algorithm_call(delta)
		move_and_slide()

func algorithm_call(delta) -> void:
	var results
	
	match algorithm:
		Algorithm.ALGORITHMS.kinematic_seek:
			results = selected_algorithm.kinematic_seek()
		Algorithm.ALGORITHMS.kinematic_arrive:
			results = selected_algorithm.kinematic_arrive()
		Algorithm.ALGORITHMS.kinematic_flee:
			results = selected_algorithm.kinematic_flee()
		Algorithm.ALGORITHMS.kinematic_wander:
			results = selected_algorithm.kinematic_wander()
		Algorithm.ALGORITHMS.dynamic_arrive:
			results = selected_algorithm.dynamic_arrive()
		Algorithm.ALGORITHMS.dynamic_seek:
			results = selected_algorithm.dynamic_seek()
		Algorithm.ALGORITHMS.dynamic_flee:
			results = selected_algorithm.dynamic_flee()
		Algorithm.ALGORITHMS.velocity_matching:
			results = selected_algorithm.velocity_matching()
		Algorithm.ALGORITHMS.pursue:
			results = selected_algorithm.pursue()
		Algorithm.ALGORITHMS.evade:
			results = selected_algorithm.evade()
	
	if results is SteeringOutput:
		if align:
			if results != null:
				var align_algorithm = Align.new()
				align_algorithm.target = target
				align_algorithm.character = character
				results.angular = align_algorithm.align().angular
					
		if lwyg:
			if results != null:
				var align_algorithm = LWYG.new()
				align_algorithm.target = target
				align_algorithm.character = character
				results.angular = align_algorithm.look_where_youre_going().angular
	
	update(results, MAX_SPEED, delta)
