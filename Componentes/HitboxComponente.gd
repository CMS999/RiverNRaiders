extends Area2D
class_name HitboxComp
@export var Vida : VidaComp

func Hit(dano: int):
	if Vida:
		Vida.Dano(dano)
	pass

