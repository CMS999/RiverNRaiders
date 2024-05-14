extends Node2D
var podeatirar = true
@onready var Alvo = get_tree().root.get_node("Level1/Jogador")
var EstaVivo := true

func _ready():
	#$VidaComponente.connect("Morto", self.Morrer)	
	pass

func _process(_delta):
	if $AtaqueComponente.projetil and podeatirar and Alvo != null:
		$AtaqueComponente.Ataque(global_position.x, global_position.y)
		podeatirar = false
	pass

func _on_timer_timeout():
	podeatirar = true
	pass

func Morrer():
	queue_free()
