class_name Miniaturizer
extends Area3D

var push: bool = true

func push_or_pop() -> void:
    var root := get_tree().get_first_node_in_group("root_world")
    if push:
        root.push()
        push = false
    else:
        root.pop()
        push = true
