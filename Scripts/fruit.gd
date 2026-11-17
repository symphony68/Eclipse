extends Node2D

var direction = 1
var speed =  Vector2(200,0)

func _process(delta: float) -> void:
	position += direction * delta * speed
	rotate(0.1)
	
	
func _on_area_2d_body_entered(body: Node2D) -> void:
	queue_free()
