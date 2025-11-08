class_name Extractor
extends Area3D

@export
var synthesizer: Synthesizer
@export
var stuff_scene: PackedScene


@onready
var _progress_bar: ProgressBar = %ProgressBar

func _ready() -> void:
	look_at(synthesizer.global_position, Vector3.UP, true)


func handle_tick() -> void:
	_progress_bar.value += 2

	if _progress_bar.value == 10:
		_progress_bar.value = 0

		var new_stuff := stuff_scene.instantiate()
		add_child(new_stuff)
		new_stuff.global_position = global_position
		new_stuff.direction = basis.z

		get_tree().get_first_node_in_group("root_world").add_stuff()

func handle_click() -> void:
	print("CLICK")
