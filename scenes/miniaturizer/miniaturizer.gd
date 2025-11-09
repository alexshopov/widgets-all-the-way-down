class_name Miniaturizer
extends Area3D


@onready
var root: RootWorld = get_tree().get_first_node_in_group("root_world")

func push() -> void:
    root.push()


func pop() -> void:
    root.pop()
