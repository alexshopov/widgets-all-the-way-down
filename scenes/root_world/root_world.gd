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

@onready
var _hud: HUD = $HUD


func _ready() -> void:
	_depth = 0

	var new_factory := spawn_factory()
	_active_factory = new_factory
	_hud._active_factory = _active_factory
	add_child(new_factory)

	SignalBus.buy_extractor_clicked.connect(_on_buy_extractor_clicked)
	SignalBus.buy_thingie_clicked.connect(_on_buy_thingie_clicked)


func _physics_process(delta: float) -> void:
	_hud.update_clock(delta)	

	_factories.get(_depth).handle_tick(delta)
	_hud.update_counts(_active_factory.resources)


func spawn_factory() -> Factory:
	var new_factory := factory_scene.instantiate()
	new_factory.depth = _depth
	_factories.set(_depth, new_factory)

	return new_factory


func push() -> void:
	_depth += 1

	remove_child(_active_factory)

	if not _factories.has(_depth):
		var new_factory := spawn_factory()
		_active_factory = new_factory
	else:
		_active_factory = _factories.get(_depth)

	_hud._active_factory = _active_factory
	add_child(_active_factory)


func pop() -> void:
	if _depth == 0:
		return

	var thingies = _active_factory.resources.thingies
	_active_factory.resources.thingies = 0

	
	remove_child(_active_factory)

	_depth -= 1
	_active_factory = _factories.get(_depth)
	_hud._active_factory = _active_factory

	add_child(_active_factory)

	if thingies != 0:
		_active_factory.add_thingies(thingies)


func _on_buy_extractor_clicked() -> void:
	_active_factory.spawn_extractor()


func _on_buy_thingie_clicked() -> void:
	_active_factory.build_thingie()
