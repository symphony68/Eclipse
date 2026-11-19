extends Label

func _process(delta: float) -> void:
	var nombre_de_joueurs = int($"../Nombre de joueur".value)
	$".".text = str(nombre_de_joueurs) + " joueurs"
