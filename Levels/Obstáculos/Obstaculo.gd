extends Area2D
class_name Obstaculo

##Dano causado por colidir com o objeto.
@export var Dano := 1

func _ready():
	$VidaComp.connect("Morto", self.Morrer)
	pass

func _on_area_entered(area:Area2D):
	if area is HitboxComp:
		print("entrei")
		area.Hit(Dano)
	pass

func Morrer():
	queue_free()
	pass
