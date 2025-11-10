extends PanelContainer

@export
var main_scene: PackedScene


func _on_button_pressed() -> void:
    get_tree().change_scene_to_packed(main_scene)
