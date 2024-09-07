extends AnimatedSprite2D

@onready var GlobalReference = get_node("/root/GlobalValues")
@export var partesRestantes := 4
signal PartDestroyed
signal morri
var Alvo 

func explode():
	partesRestantes -= 1
	PartDestroyed.emit()	
	GlobalReference.pontuacao += 750
	if partesRestantes <= 0:
		GlobalReference.pontuacao += 1250
		morri.emit()
		play("morte")
		scale = Vector2(6,6)
		
