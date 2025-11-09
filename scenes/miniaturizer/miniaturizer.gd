class_name Miniaturizer
extends Area3D

var is_push := true

@onready
var root: RootWorld = get_tree().get_first_node_in_group("root_world")


func traverse() -> void:
    if is_push:
        push()
    else:
        pop()


func push() -> void:
    root.push()


func pop() -> void:
    root.pop()
