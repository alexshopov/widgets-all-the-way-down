class_name Factory
extends Node3D

@export
var base_tick_length: float = 5

var depth :int :
    set(value):
        depth = value

        if depth > 0:
            tick_length /= depth + 1

var tick_length := 1.0
var time_elapsed := 0.0

@onready
var extractor_manager: ExtractorManager = $ExtractorManager


func handle_tick(delta: float) -> void:
    time_elapsed += delta

    if time_elapsed > tick_length:
        for extractor in extractor_manager.get_children():
            extractor.handle_tick()
        time_elapsed = 0.0
