class_name Device
extends Node3D


@export
var increment_label_scene: PackedScene


func show_increment(value: int) -> void:
	var increment_label := increment_label_scene.instantiate()
	add_child(increment_label)
	increment_label.global_position = global_position
	increment_label.global_position.y += 1

	increment_label.text = "+ %d" % value

	var tween := create_tween()
	var end_pos: Vector3 = increment_label.position
	end_pos.y += 3

	tween.tween_property(increment_label, "position", end_pos, 0.5)
	tween.tween_callback(func(): increment_label.queue_free())
