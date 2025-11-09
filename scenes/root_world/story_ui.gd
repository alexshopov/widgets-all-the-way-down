extends Control

@onready
var story_panel: StoryPanel = $StoryPanel

func _ready() -> void:
	if not StoryManager.intro_shown:
		show_intro()


func show_panel(msg: String) -> void:
	story_panel.show_story_panel(msg)


func close_panel() -> void:
	story_panel.visible = false

# show when game starts
func show_intro() -> void:
	var msg_01 := "We need you to manufacture [color=blue]100 WIDGETS[/color] as quickly as possible."
	var msg_02 := "Press the big red button to start generating [color=blue]STUFF[/color] which will be fed into the [color=green]Synthesizer[/color]."

	show_panel("%s %s" % [msg_01, msg_02])

# show when first 10 STUFF are created
func show_extractor_tutorial_01() -> void:
	var msg_01 := "Click the [color=green]Synthesizer[/color] in the middle of the board to open the build menu."
	var msg_02 := "From there you can convert [color=blue]STUFF[/color] into [color=blue]THINGIES[/color] and [color=blue]THINGIES[/color] into [color=blue]WIDGETS[/color]."

	show_panel("%s\n%s" % [msg_01, msg_02])
	StoryManager.extractor_tutorial_shown = true

# show when synthesizer is clicked the first time
func show_extractor_tutorial_02() -> void:
	var msg_01 := "We'll need [color=blue]10,000 STUFF[/color] to create all the [color=blue]WIDGETS[/color]. We need to speed this up."
	var msg_02 := "Start building [color=green]Extractors[/color] to automatically generate more [color=blue]STUFF[/color]"

	show_panel("%s\n%s" % [msg_01, msg_02])
	StoryManager.extractor_tutorial_02_shown = true

# show when 2 extractors have been built
func show_factory_tutorial_01() -> void:
	var msg_01 := "This is still taking too long. We have to go deeper. We can build a copy of this factory within the factory to speed thing up."
	var msg_02 := "Build a [color=green]Factory[/color]. The new factory will operate twice as fast as this one."

	show_panel("%s\n%s" % [msg_01, msg_02])
	StoryManager.extractor_tutorial_02_shown = true

# show when the second factory is buile
func show_factory_tutorial_02() -> void:
	var msg_01 := "Did I mention the new [color=green]Factory[/color] exists in a miniature sub-dimension?"
	var msg_02 := "Click the [color=green]Miniaturizer Rings[/color] to shrink down and enter the sub-dimension factory."

	show_panel("%s\n%s" % [msg_01, msg_02])
	StoryManager.extractor_tutorial_02_shown = true
