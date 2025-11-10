extends Node

var story_ui: Control

var intro_shown := false
var extractor_tutorial_shown := false
var extractor_tutorial_02_shown := false
var factory_tutorial_01_shown := false
var factory_tutorial_02_shown := false
var factory_tutorial_03_shown := false
var max_depth_tutorial_shown := false

func reset() -> void:
    intro_shown = false
    extractor_tutorial_shown = false
    extractor_tutorial_02_shown = false
    factory_tutorial_01_shown = false
    factory_tutorial_02_shown = false
    factory_tutorial_03_shown = false
    max_depth_tutorial_shown = false


func show_intro() -> void:
    story_ui.show_intro()
    intro_shown = true
    # story_ui.close_panel()


func extractor_tutorial() -> void:
    story_ui.show_extractor_tutorial_01()
    extractor_tutorial_shown = true


func extractor_tutorial_02() -> void:
    if not extractor_tutorial_shown:
        return

    story_ui.show_extractor_tutorial_02()
    extractor_tutorial_02_shown = true


func factory_tutorial_01() -> void:
    if not extractor_tutorial_02_shown:
        return

    story_ui.show_factory_tutorial_01()
    factory_tutorial_01_shown = true
    

func factory_tutorial_02() -> void:
    if not factory_tutorial_01_shown: return

    story_ui.show_factory_tutorial_02()
    factory_tutorial_02_shown = true
    

func factory_tutorial_03() -> void:
    if not factory_tutorial_02_shown: return

    story_ui.show_factory_tutorial_03()
    factory_tutorial_03_shown = true


func max_depth_tutorial() -> void:
    if not factory_tutorial_03_shown: return

    story_ui.show_max_depth_tutorial()
    max_depth_tutorial_shown = true