class_name Factory
extends Node3D

const MAX_DEPTH = 4

var extractor_cost := 10
@export
var factory_cost := 25
@export
var thingie_cost := 25
@export
var widget_cost := 10
@export
var base_tick_length: float = 5

@export
var extractor_scene: PackedScene
@export
var miniaturizer_scene: PackedScene

var depth := 0

var _tick_intervals: Dictionary = {
	0: 5.0,
	1: 2.5,
	2: 1.0,
	3: 0.5,
	4: 0.25
}

var resources: Dictionary = {
	"stuff": 0,
	"thingies": 0,
	"widgets": 0
}

var _extractor_radius := 6.6
var _extractor_rotation := PI / 3
var _extractor_angle := PI / 6

@onready
var _extractor_manager: ExtractorManager = $ExtractorManager
@onready
var _synthesizer: Synthesizer = $Synthesizer
@onready
var camera: Camera3D = $RayCastCamera


func _ready() -> void:
	# go up
	if depth > 0:
		var new_miniaturizer := miniaturizer_scene.instantiate()
		new_miniaturizer.is_push = false
		add_child(new_miniaturizer)
		new_miniaturizer.global_position = Vector3(0, 4, 0)
		new_miniaturizer.rotate(Vector3(0, 0, 1), PI)


func handle_tick(delta: float) -> void:
	for extractor in _extractor_manager.get_children():
		add_stuff(extractor.handle_tick(delta, _tick_intervals.get(depth)))


func add_stuff(value: int) -> void:
	resources.stuff += value


func add_thingies(amount: int) -> void:
	resources.thingies += amount
	_synthesizer.show_increment(amount)


func spawn_extractor() -> void:
	if _extractor_manager.get_child_count() == 5:
		return

	resources.stuff -= extractor_cost
	var extractor := extractor_scene.instantiate()
	
	_extractor_manager.add_child(extractor)

	var pos := Vector3(3.3, 0, 5.7)
	pos.x = _extractor_radius * sin(_extractor_angle)
	pos.z = _extractor_radius * cos(_extractor_angle)
	_extractor_angle += _extractor_rotation
	extractor.global_position = pos 

	extractor.look_at(_synthesizer.global_position, Vector3.UP, true)

	if not StoryManager.factory_tutorial_01_shown and _extractor_manager.get_child_count() == 2:
		StoryManager.factory_tutorial_01()


func build_factory() -> void:
	resources.stuff -= factory_cost

	# go down
	if depth < MAX_DEPTH:
		var new_miniaturizer := miniaturizer_scene.instantiate()
		add_child(new_miniaturizer)
		new_miniaturizer.global_position = Vector3(0, -3, 0)

	if not StoryManager.factory_tutorial_02_shown:
		StoryManager.factory_tutorial_02()


func build_thingie() -> void:
	_synthesizer.build_thingie()


func build_widget() -> void:
	_synthesizer.build_widget()
