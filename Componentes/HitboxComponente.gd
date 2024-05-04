extends Area2D
class_name HitboxComp
@export var Vida : VidaComponente

func Hit(ataque: Ataque):
	print("nera4")
	if Vida:
		Vida.Dano(ataque)


func _on_area_entered(area:Area2D):
	print("nera5")
	pass # Replace with function body.
