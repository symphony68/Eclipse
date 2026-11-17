extends Area2D

@onready var scene_mort = preload("res://Scenes/container.tscn")

func _on_body_entered(body: CharacterBody2D) -> void:
	print("mort")
	$"../../Player/Camera2D/Container".visible = true
	
