class_name StoryPanel
extends PanelContainer

@onready
var copy_label: RichTextLabel = %CopyLabel


func show_story_panel(msg: String) -> void:
    copy_label.text = msg
    visible = true
    

func _on_close_button_pressed() -> void:
    visible = false
