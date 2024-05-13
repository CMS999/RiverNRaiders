extends Node2D
## Node que oferece métodos para controle de vida 
class_name VidaComp

## Permite o controle de animações (dano, morte, etc)
@export var Animacoes : AnimatedSprite2D

## Define o valor Máximo/Inicial de vida
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
