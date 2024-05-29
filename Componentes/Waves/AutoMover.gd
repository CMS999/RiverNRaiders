extends PathFollow2D
class_name AutoMover

var velocidade : float = 0.8

func _process(delta):
	progress_ratio += delta*velocidade

	if progress_ratio == 1:
		queue_free()
	pass

func SETVelocidade(NovaVelocidade: float):
	velocidade = NovaVelocidade
	pass
