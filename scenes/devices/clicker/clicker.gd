class_name Clicker
extends Device

@export
var parent: Factory
@export
var stuff_scene: PackedScene

var _stuff_per_click: int
var _can_click := true

@onready
var _clicker_button: MeshInstance3D = $Model/ClickerButton

func _ready() -> void:
    _stuff_per_click = 1 * (parent.depth + 1)


func handle_click() -> void:
    if not _can_click:
        return

    _can_click = false
    var tween := create_tween()
    var starting_position := _clicker_button.position
    var ending_position := starting_position
    ending_position.y -= 0.25

    tween.tween_property(_clicker_button, "position", ending_position, 0.1)
    tween.tween_property(_clicker_button, "position", starting_position, 0.1)
    tween.tween_callback(func(): _can_click = true)

    var new_stuff := stuff_scene.instantiate()
    add_child(new_stuff)
    new_stuff.global_position = $Model/ClickerBody.global_position
    new_stuff.direction = -basis.z

    show_increment(_stuff_per_click)
    parent.add_stuff(_stuff_per_click)

