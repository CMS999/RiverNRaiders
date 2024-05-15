extends Area2D
class_name Obstaculo

##Dano causado por colidir com o objeto.
@export var Dano := 1


func _on_area_entered(area:Area2D):
	if area is HitboxComp:
		area.Hit(Dano)
	pass
