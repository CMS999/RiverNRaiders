extends Polygon2D

@export var partesRestantes := 4
signal PartDestroyed

func explode():
	partesRestantes -= 1
	PartDestroyed.emit()	
	if partesRestantes <= 0:
		queue_free()
