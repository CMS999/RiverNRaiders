extends Node2D
class_name VidaComponente

@export var VidaMaxima := 10
var VidaAtual : int

func _ready():
	VidaAtual = VidaMaxima
	print("Atual: ", VidaAtual)
	print("maxima: ", VidaMaxima)
	pass

func Dano(ataque: Ataque):
	VidaAtual -= ataque.dano
	print("dano ",VidaAtual)
	if(VidaAtual <= 0):
		get_parent().queue_free()
		'if get_parent().get_node("Morte"):
			get_parent().get_node("Voo").visible = false
			get_parent().get_node("Morte").visible = true
			get_parent().get_node("Morte").play()
			get_parent().queue_free()'
	pass
