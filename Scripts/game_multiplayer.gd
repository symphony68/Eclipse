extends Node2D

var peer = ENetMultiplayerPeer.new()
const PLAYER = preload("res://Scenes/player.tscn")
@onready var multiplayer_UI = $UI/Multiplayer
	
func _on_host_pressed() -> void:
	peer.create_server(25565)
	multiplayer.multiplayer_peer = peer
	
	multiplayer.peer_connected.connect(
		func (pid):
			print("Peer " + str(pid) + " has joined the game!")
			add_player(pid)
	)
	add_player(multiplayer.get_unique_id())

func _on_join_pressed() -> void:
	peer.create_client("localhost", 25565)
	multiplayer.multiplayer_peer = peer
	multiplayer_UI.hide()

	
func add_player(pid):
	var player = PLAYER.instantiate()
	player.name = str(pid)
	add_child(player)
	multiplayer_UI.hide()
	
func get_connected_clients_count():
	if not multiplayer.has_multiplayer_peer():
		return 0
		
	if multiplayer.is_server():
		return multiplayer.get_peers().size()
		
	return multiplayer.get_peers().size() - 1
	
func _process(delta: float) -> void:
	var nombres_de_joueurs_connectés = get_connected_clients_count()
	$Label.text = str(nombres_de_joueurs_connectés)
	if nombres_de_joueurs_connectés >= $"UI/Multiplayer/VBoxContainer/Nombre de joueur".value :
		$Area2D/CollisionShape2D.disabled = true
	
