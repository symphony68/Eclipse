extends Node2D

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("Tir"):
		var scene_fruit = preload("res://Scenes/fruit.tscn")
		var instance = scene_fruit.instantiate()
		instance.position = $Player/tir.global_position
		add_child(instance)
			
