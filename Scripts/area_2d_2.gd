extends Area2D

var gagnant

func _on_body_entered(body: Node2D) -> void:
	gagnant = body.name
	$"../Gagnant".text = "Bravo " + str(gagnant)
	
