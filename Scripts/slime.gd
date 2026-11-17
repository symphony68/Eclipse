extends Node2D

@onready var Left = $RayLeft
@onready var Right = $RayRight

var direction = 1
var speed = 215

func _physics_process(delta: float) -> void:
	if Left.is_colliding() :
		direction = 1
		$AnimatedSprite2D.flip_h = true
		
	if Right.is_colliding() :
		direction = -1
		$AnimatedSprite2D.flip_h = false
		
	position.x += direction * delta * speed
	
func _on_killzone_area_entered(area: Area2D) -> void:
	queue_free()
