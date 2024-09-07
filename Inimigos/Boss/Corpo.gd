extends AnimatedSprite2D


@export var partesRestantes := 4
signal PartDestroyed
signal morri
var Alvo 

func explode():
	partesRestantes -= 1
	PartDestroyed.emit()	
	if partesRestantes <= 0:
		morri.emit()
		play("morte")
		scale = Vector2(6,6)
		
