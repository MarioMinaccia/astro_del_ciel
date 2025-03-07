extends UserInterface

@onready var button_send: Button = $ButtonSend
@onready var text_edit: TextEdit = $TextEdit
@onready var line_edit: LineEdit = $LineEdit


func _ready() -> void:
	button_send.pressed.connect(_on_send_pressed)


func _on_send_pressed() -> void:
	var new_message := Message.new()
	new_message.title = line_edit.text
	new_message.text = text_edit.text
	var data: Dictionary = new_message.serialize()
	send_message.rpc(data)


@rpc("any_peer", "reliable", "call_local")
func send_message(data: Dictionary) -> void:
	line_edit.text = data["title"]
	text_edit.text = data["text"]
