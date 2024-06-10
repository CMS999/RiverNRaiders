extends ProjetilComp

@export_range(-180,180) var rotacao: float

func _ready():
	rotacao = deg_to_rad(rotacao)
	pass

func _process(delta):
	position -= Vector2(0, 1).rotated(rotacao) * delta * Velocidade
	pass
