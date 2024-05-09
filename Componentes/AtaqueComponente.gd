extends Node2D
class_name AtaqueComponente

@export var projetil : PackedScene

func Ataque(PositionX: float, PositionY: float):
	var bullet = projetil.instantiate()
	var PositionGlobal : Vector2
	PositionGlobal.x = PositionX
	PositionGlobal.y = PositionY
	get_tree().root.get_node("Particulas").add_child(bullet)
	bullet.get_node("TipoBala").start(PositionGlobal)
