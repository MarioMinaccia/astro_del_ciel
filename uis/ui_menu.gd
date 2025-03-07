extends UserInterface

@onready var button_connect: Button = $ButtonConnect
@onready var button_host: Button = $ButtonHost
@onready var button_preferences: Button = $ButtonPreferences


func _ready() -> void:
	button_connect.pressed.connect(_on_connect_pressed)
	button_host.pressed.connect(_on_host_pressed)
	button_preferences.pressed.connect(_on_preferences_pressed)


func _on_preferences_pressed() -> void:
	hide()
	UIManager.ui_preferences.update()
	UIManager.ui_preferences.show()


func _on_connect_pressed() -> void:
	var peer = ENetMultiplayerPeer.new()
	peer.create_client(Global.address, Global.port)
	multiplayer.multiplayer_peer = peer
	hide()
	UIManager.ui_message.show()


func _on_host_pressed() -> void:
	var peer = ENetMultiplayerPeer.new()
	peer.create_server(Global.port)
	multiplayer.multiplayer_peer = peer
	hide()
	UIManager.ui_message.show()
