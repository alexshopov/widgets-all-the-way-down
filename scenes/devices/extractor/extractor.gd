class_name Extractor
extends Device

@export
var synthesizer: Synthesizer
@export
var stuff_scene: PackedScene


var _elapsed_time := 0.0


@onready
var _progress_bar: ProgressBar = %ProgressBar


func handle_tick(delta: float, tick_interval: float) -> int:
	_elapsed_time += delta
	var new_value := (_elapsed_time / tick_interval) * 10
	_progress_bar.value = new_value

	if _progress_bar.value == 10:
		_progress_bar.value = 0
		_elapsed_time = 0.0
		show_increment(1)

		var new_stuff := stuff_scene.instantiate()
		add_child(new_stuff)
		new_stuff.global_position = $Model.global_position
		new_stuff.direction = basis.z

		return 1

	return 0
