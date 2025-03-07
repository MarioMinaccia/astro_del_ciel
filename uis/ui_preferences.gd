extends UserInterface

@onready var line_edit_name: LineEdit = $LineEditName
@onready var color_rect: ColorRect = $ColorRect
@onready var button_ok: Button = $ButtonOK


func _ready() -> void:
	button_ok.pressed.connect(_on_ok_pressed)
	line_edit_name.text_submitted.connect(_on_text_submitted)


func update(_data: Dictionary = {}) -> void:
	line_edit_name.text = Global.local_user.name
	color_rect.color = Global.local_user.color


func _on_text_submitted(_text: String) -> void:
	Global.local_user.name = _text
	ResourceSaver.save(Global.local_user)


func _on_ok_pressed() -> void:
	hide()
	UIManager.ui_menu.show()
