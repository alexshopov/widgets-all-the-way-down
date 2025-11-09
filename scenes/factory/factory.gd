class_name Factory
extends Node3D

@export
var extractor_cost := 10
@export
var thingie_cose := 50
@export
var base_tick_length: float = 5
@export
var extractor_scene: PackedScene

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

@onready
var _extractor_manager: ExtractorManager = $ExtractorManager
@onready
var _synthesizer: Synthesizer = $Synthesizer
@onready
var _synthesizer_model: MeshInstance3D = $Synthesizer/Model


func handle_tick(delta: float) -> void:
	for extractor in _extractor_manager.get_children():
		add_stuff(extractor.handle_tick(delta, _tick_intervals.get(depth)))


func add_stuff(value: int) -> void:
	resources.stuff += value


func add_thingies(amount: int) -> void:
	resources.thingies += amount
	_synthesizer.show_increment(amount)


func spawn_extractor() -> void:
	resources.stuff -= extractor_cost
	var extractor := extractor_scene.instantiate()
	
	_extractor_manager.add_child(extractor)
	extractor.global_position = Vector3(6, 0, 0)
	var pos := _synthesizer_model.global_position
	pos.y = 0.5
	extractor.look_at(_synthesizer.global_position, Vector3.UP, true)


func build_thingie() -> void:
	resources.stuff -= thingie_cose
	resources.thingies += 1
