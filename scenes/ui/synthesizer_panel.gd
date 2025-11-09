extends PanelContainer


var active_factory: Factory

@onready
var _hud: HUD = get_tree().get_first_node_in_group("hud")


func _input(_event: InputEvent) -> void:
	if Input.is_action_just_pressed("right_click"):
		if visible:
			visible = false


func _on_build_extractor_button_pressed() -> void:
	if active_factory.resources.stuff >= 10:
		SignalBus.buy_extractor_clicked.emit()
		visible = false


func _on_build_factory_button_pressed() -> void:
	if active_factory.resources.stuff >= 50:
		SignalBus.buy_factory_clicked.emit()
		visible = false


func _on_build_thingie_button_pressed() -> void:
	if active_factory.resources.stuff >= 100:
		SignalBus.buy_thingie_clicked.emit()
		visible = false


func _on_extractor_container_mouse_entered() -> void:
	_hud.show_info_panel("Extractor", "Automatically extracts [color=green]STUFF[/color] out of the void")


func _on_extractor_container_mouse_exited() -> void:
	_hud.hide_info_panel()


func _on_factory_container_mouse_exited() -> void:
	pass # Replace with function body.


func _on_factory_container_mouse_entered() -> void:
	pass # Replace with function body.


func _on_thingie_container_mouse_entered() -> void:
	pass # Replace with function body.


func _on_thingie_container_mouse_exited() -> void:
	pass # Replace with function body.

