extends Node2D
class_name VidaComponente

@export var VidaMaxima:= 10
var VidaAtual : int

func _ready():
	VidaAtual = VidaMaxima

func Dano(ataque: Ataque):
	VidaAtual -= ataque.dano
	print("nera1")
	if(VidaAtual <= 0):
		queue_free()