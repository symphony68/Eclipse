extends Area2D
@onready var player = $"."

func _on_body_entered(body: CharacterBody2D) -> void:
	var player_id: int = body.name.to_int()
	print("Le joueur avec l'ID ", player_id, " a touché la zone !")
	body.teleporter_vers.rpc_id(player_id, $"../../../Respawn".global_position)
