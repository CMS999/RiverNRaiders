extends Area2D
class_name HitboxComp
@export var Vida : VidaComponente

func Hit(ataque: Ataque):
	if Vida:
		Vida.Dano(ataque)

