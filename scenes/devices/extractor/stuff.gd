class_name Stuff
extends Area3D

@export
var speed := 8.0

var direction := Vector3.FORWARD


func _process(delta: float) -> void:
    position += direction * speed * delta


