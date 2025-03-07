class_name Message extends Resource

@export var title: String
@export var text: String


static func deserialize(data: Dictionary) -> Message:
	var new_message := Message.new()
	new_message.text = data["text"]
	new_message.title = data["title"]
	return new_message


func serialize() -> Dictionary:
	return {
		"title": title,
		"text": text,
	}
