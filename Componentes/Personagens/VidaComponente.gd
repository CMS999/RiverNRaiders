extends Node2D
## Node que oferece métodos para controle de vida 
class_name VidaComp

signal Morto
## Define o valor Máximo/Inicial de vida
@export var VidaMaxima := 10

var VidaAtual : int

func _ready():
	VidaAtual = VidaMaxima
	pass

func Dano(dano: int):
	VidaAtual -= dano
	if(VidaAtual <= 0):		
		Morto.emit()		
	pass
