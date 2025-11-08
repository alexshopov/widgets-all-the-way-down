extends MarginContainer

@onready
var stuff_label: Label = %StuffLabel
@onready
var thingies_label: Label = %ThingiesLabel
@onready
var widget_label: Label = %WidgetLabel
@onready
var depth_label: Label = %DepthLabel


func _ready() -> void:
	SignalBus.stuff_updated.connect(_on_stuff_updated)
	SignalBus.thingies_updated.connect(_on_thingies_updated)
	SignalBus.widgets_updated.connect(_on_widgets_updated)
	SignalBus.factory_level_changed.connect(_on_factory_level_changed)


func _on_stuff_updated(stuff_count: int) -> void:
	stuff_label.text = "Stuff: %d" % stuff_count


func _on_thingies_updated(thingie_count: int) -> void:
	thingies_label.text = "Thingies: %d" % thingie_count


func _on_widgets_updated(widget_count: int) -> void:
	widget_label.text = "Widgets: %d" % widget_count
	

func _on_factory_level_changed(factory_level: int) -> void:
	depth_label.text = "Depth %d" % factory_level
