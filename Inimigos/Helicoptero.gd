extends Inimigo



func _ready():
	super()
	if global_position.x <= 160:
		animacoes.flip_h = true