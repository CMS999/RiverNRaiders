extends Node2D
var podeatirar = true
@onready var Jogador = get_tree().root.get_node("Level1/Jogador/VidaComponente")

func _ready():
	pass 


func _process(_delta):
	if $AtaqueComponente.projetil and podeatirar and Jogador != null:
		$AtaqueComponente.Ataque(global_position.x, global_position.y)
		podeatirar = false
	pass


func _on_timer_timeout():
	podeatirar = true
	pass
