class_name Synthesizer
extends Area3D

var _stuff_count := 0
var _thingie_count := 0

@onready
var _progress_bar: ProgressBar = %ProgressBar

func _on_area_entered(area: Area3D) -> void:
    if area is Stuff:
        _stuff_count += 1
        area.queue_free()

        _progress_bar.value += 1

        if _stuff_count == 10:
            _stuff_count = 0
            _progress_bar.value = 0
            _thingie_count += 1
            get_tree().get_first_node_in_group("root_world").add_thingie()

