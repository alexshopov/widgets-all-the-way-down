class_name RootWorld
extends Node3D

@export
var factory_scene: PackedScene

var _factories: Dictionary = {}
var _active_factory: Factory
var _depth: int :
	set(value):
		_depth = value
		SignalBus.factory_level_changed.emit(_depth)

var _stuff := 0
var _thingies := 0
var _widgets := 0


func _ready() -> void:
	_depth = 0

	var new_factory := spawn_factory()
	_active_factory = new_factory
	add_child(new_factory)


func _physics_process(delta: float) -> void:
	_factories.get(_depth).handle_tick(delta)


func _input(_event: InputEvent) -> void:
	if Input.is_action_just_pressed("right_click"):
		pop()


func spawn_factory() -> Factory:
	var new_factory := factory_scene.instantiate()
	new_factory.depth = _depth
	_factories.set(_depth, new_factory)

	return new_factory


func push() -> void:
	_depth += 1
	var new_factory := spawn_factory()

	remove_child(_active_factory)
	_active_factory = new_factory
	add_child(_active_factory)


func pop() -> void:
	if _depth > 0:
		remove_child(_active_factory)
		_depth -= 1
		_active_factory = _factories.get(_depth)
		add_child(_active_factory)


func add_stuff() -> void:
	_stuff += 1
	SignalBus.stuff_updated.emit(_stuff)


func add_thingie() -> void:
	_thingies += 1
	SignalBus.thingies_updated.emit(_thingies)


func add_widget() -> void:
	_widgets += 1
	SignalBus.widgets_updated.emit(_widgets)
