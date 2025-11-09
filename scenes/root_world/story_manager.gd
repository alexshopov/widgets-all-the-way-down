extends Node

@export
var story_ui: Control


func _ready() -> void:
    show_intro()


func show_intro() -> void:
    var msg_01 := "We need you to manufacture [color=green]100 WIDGETS[/color] as quickly as possible."
    var msg_02 := "Press the big red button to start generating [color=green]STUFF[/color]"

    story_ui.show_panel("%s %s" % [msg_01, msg_02])


func show_extractor() -> void:
    var msg_01 := "Click the Synthesizer to convert [color=green]STUFF[/green] into [color=green]THINGIES[/color] and [color=green]THINGIES[/color] into [color=green]WIDGETS[/color]"

    story_ui.show_panel("%s\n%s" % [msg_01])