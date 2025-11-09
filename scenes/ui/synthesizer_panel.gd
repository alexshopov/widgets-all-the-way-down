extends PanelContainer


var active_factory: Factory


func _input(_event: InputEvent) -> void:
	if Input.is_action_just_pressed("right_click"):
		if visible:
			visible = false


func _on_build_extractor_button_pressed() -> void:
	if active_factory.resources.stuff >= 10:
		SignalBus.buy_extractor_clicked.emit()
		visible = false


func _on_build_thingie_button_pressed() -> void:
	if active_factory.resources.stuff >= 50:
		SignalBus.buy_thingie_clicked.emit()
		visible = false
