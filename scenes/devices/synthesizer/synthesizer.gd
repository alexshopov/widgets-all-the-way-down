class_name Synthesizer
extends Device

var _parent: Factory
var _stuff_count := 0 :
	set(value):
		_stuff_count = value

		if _stuff_count == 10 and not StoryManager.extractor_tutorial_shown:
			StoryManager.extractor_tutorial()

var _automate_thingie := false
var _thingie_building := false
var _automate_widget := false

@onready
var _progress_bar: ProgressBar = %ProgressBar
@onready
var _progress_bar_sprite: Sprite3D = $ProgressBarSprite
@onready
var _thingie_timer: Timer = $ThingieTimer
@onready
var _widget_timer: Timer = $WidgetTimer


func _ready() -> void:
	_parent = get_parent()
	_progress_bar.max_value = _thingie_timer.wait_time
	_progress_bar.value = 0
	_progress_bar_sprite.visible = false


func _on_area_entered(area: Area3D) -> void:
	if area is Stuff:
		_stuff_count += 1
		area.queue_free()

		_progress_bar.value += 1


func _process(_delta: float) -> void:
	if _thingie_timer.time_left != 0 and _thingie_building:
		_progress_bar.value = _thingie_timer.wait_time - _thingie_timer.time_left
	elif _widget_timer.time_left != 0:
		_progress_bar.value = _widget_timer.wait_time - _widget_timer.time_left


func build_thingie() -> void:
	if _parent.resources.stuff > _parent.thingie_cost:
		_thingie_building = true
		_progress_bar_sprite.visible = true
		_parent.resources.stuff -= _parent.thingie_cost
	else:
		_thingie_building = false

	_thingie_timer.start(_thingie_timer.wait_time)


func _on_thingie_timer_timeout() -> void:
	if _thingie_building:
		_progress_bar.value = 0
		_progress_bar_sprite.visible = false
		_parent.resources.thingies += 1
		_thingie_building = false

	if _automate_thingie:
		build_thingie()


func build_widget() -> void:
	if _parent.resources.thingies < _parent.widget_cost:
		return

	_progress_bar.value = 0
	_progress_bar_sprite.visible = true
	_parent.resources.thingies -= _parent.widget_cost
	_widget_timer.start(_widget_timer.wait_time)


func _on_widget_timer_timeout() -> void:
	_progress_bar_sprite.visible = false
	_parent.resources.widgets += 1

	if _parent.resources.widgets == 20:
		SignalBus.widgets_completed.emit()
		return

	if _automate_widget:
		build_widget()
