class_name Synthesizer
extends Device

var _parent: Factory
var _stuff_count := 0


@onready
var _progress_bar: ProgressBar = %ProgressBar

func _ready() -> void:
	_parent = get_parent()


func _on_area_entered(area: Area3D) -> void:
	if area is Stuff:
		_stuff_count += 1
		area.queue_free()

		_progress_bar.value += 1
