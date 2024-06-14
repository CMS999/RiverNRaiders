extends Node2D
## Node que oferece métodos para controle de vida 
class_name VidaComp

var escudo : bool = false

signal Morto
## Define o valor Máximo/Inicial de vida
@export var VidaMaxima := 10

var VidaAtual : int

func _ready():
	VidaAtual = VidaMaxima
	pass
	
func alterar_escudo() -> void:
	escudo = true
	pass  

func Dano(dano: int):
	if not escudo:
		VidaAtual -= dano
	if(VidaAtual <= 0):		
		Morto.emit()		
	pass
