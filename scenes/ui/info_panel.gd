extends PanelContainer

@onready
var _title_label: Label = %TitleLabel
@onready
var _info_label: RichTextLabel = %InfoLabel


func show_info_panel(title: String, info: String) -> void:
    _title_label.text = title
    _info_label.text = info
    visible = true


func hide_info_panel() -> void:
    visible = false
