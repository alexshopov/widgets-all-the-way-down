extends PanelContainer


var active_factory: Factory :
	set(value):
		active_factory = value

		if _widget_container:
			if active_factory.depth > 0:
				_widget_container.visible = false
				_automate_widget.visible = false
			else:
				_widget_container.visible = true
				_automate_widget.visible = true

		if _factory_container:
			if active_factory.depth == 4:
				_factory_container.visible = false
			else:
				_factory_container.visible = true


@onready
var _hud: HUD = get_tree().get_first_node_in_group("hud")
@onready
var _widget_container: HBoxContainer = %WidgetContainer
@onready
var _factory_container: HBoxContainer = %FactoryContainer
@onready
var _automate_thingie: Button = %AutomateThingie
@onready
var _automate_widget: Button = %AutomateWidget


func _input(_event: InputEvent) -> void:
	if Input.is_action_just_pressed("right_click"):
		if visible:
			visible = false


func _on_build_extractor_button_pressed() -> void:
	if active_factory.resources.stuff >= active_factory.extractor_cost:
		SignalBus.buy_extractor_clicked.emit()


func _on_build_factory_button_pressed() -> void:
	if active_factory.resources.stuff >= active_factory.factory_cost:
		SignalBus.buy_factory_clicked.emit()


func _on_build_thingie_button_pressed() -> void:
	if active_factory.resources.stuff >= active_factory.thingie_cost:
		SignalBus.buy_thingie_clicked.emit()


func _on_build_widget_button_pressed() -> void:
	if active_factory.resources.thingies >= active_factory.widget_cost:
		SignalBus.buy_widget_clicked.emit()


func _on_extractor_container_mouse_entered() -> void:
	_hud.show_info_panel("Extractor", "Automatically extracts [color=blue]STUFF[/color] out of the void")


func _on_extractor_container_mouse_exited() -> void:
	_hud.hide_info_panel()


func _on_factory_container_mouse_entered() -> void:
	_hud.show_info_panel("Factory", "Build a new factory on a lower dimensional layer")


func _on_factory_container_mouse_exited() -> void:
	_hud.hide_info_panel()


func _on_thingie_container_mouse_entered() -> void:
	_hud.show_info_panel("Thingie", "Made of [color=blue]STUFF[/color], [color=blue]THINGIES[/color] are the building blocks of [color=blue]WIDGETS[/color]")


func _on_thingie_container_mouse_exited() -> void:
	_hud.hide_info_panel()


func _on_widget_container_mouse_entered() -> void:
	_hud.show_info_panel("Widget", "Information about [color=blue]WIDGETS[/color] is on a need to know basis. If you have to ask, you don't need to know")


func _on_widget_container_mouse_exited() -> void:
	_hud.hide_info_panel()


func _on_close_button_pressed() -> void:
	visible = false


func _on_automate_thingie_toggled(toggled_on: bool) -> void:
	active_factory._synthesizer._automate_thingie = toggled_on
	active_factory._synthesizer._automate_widget = !toggled_on
	_automate_widget.set_pressed(!toggled_on)


func _on_automate_widget_toggled(toggled_on: bool) -> void:
	active_factory._synthesizer._automate_widget = toggled_on

	active_factory._synthesizer._automate_thingie = !toggled_on
	_automate_thingie.set_pressed(!toggled_on)


