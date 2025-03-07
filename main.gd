extends Node

@onready var ui_menu: Control = $UIMenu
@onready var ui_message: Control = $UIMessage
@onready var ui_preferences: Control = $UIPreferences


func _ready() -> void:
	UIManager.ui_menu = ui_menu
	UIManager.ui_message = ui_message
	UIManager.ui_preferences = ui_preferences
