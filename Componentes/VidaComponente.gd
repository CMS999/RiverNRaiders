extends Node2D
class_name VidaComp

@export var Animacoes : AnimatedSprite2D
@export var VidaMaxima := 10
var VidaAtual : int

func _ready():
	VidaAtual = VidaMaxima
	pass

func Dano(dano: int):
	VidaAtual -= dano
	if(VidaAtual <= 0):
		get_parent().queue_free()
	pass
