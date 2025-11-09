class_name HUD
extends MarginContainer


var _elapsed_time := 0.0
var _active_factory: Factory :
	set(value):
		_active_factory = value
		_synthesizer_panel.active_factory = _active_factory

@onready
var _elapsed_time_label: Label = $ElapsedTimeLabel
@onready
var _stuff_label: Label = %StuffLabel
@onready
var _thingies_label: Label = %ThingiesLabel
@onready
var _widget_label: Label = %WidgetLabel
@onready
var _depth_label: Label = %DepthLabel
@onready
var _synthesizer_panel: PanelContainer = $SynthesizerPanel


func _ready() -> void:
	_synthesizer_panel.visible = false
	SignalBus.synthesizer_clicked.connect(func(): _synthesizer_panel.visible = true)
	SignalBus.factory_level_changed.connect(_on_factory_level_changed)


func update_counts(resources: Dictionary) -> void:
	_stuff_label.text = "Stuff: %d" % resources.stuff 
	_thingies_label.text = "Thingies: %d" % resources.thingies 
	_widget_label.text = "Widgets: %d" % resources.widgets


func _on_factory_level_changed(factory_level: int) -> void:
	_depth_label.text = "Depth %d" % factory_level


func update_clock(delta: float) -> void:
	_elapsed_time += delta
	var minutes: float = floor(_elapsed_time / 60.0)
	var seconds := fmod(_elapsed_time, 60)
	
	_elapsed_time_label.text = "%02d:%02d" % [minutes, seconds]
