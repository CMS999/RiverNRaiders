extends ProjetilComp

func _process(delta):
	position -= Vector2(0, 1).rotated(0) * delta * Velocidade
	pass
