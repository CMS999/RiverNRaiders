extends Node2D
var podeatirar = true
@onready var Jogador = get_tree().root.get_node("Level1/Jogador/VidaComponente")
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if $AtaqueComponente.projetil and podeatirar and Jogador != null:
		$AtaqueComponente.Ataque(global_position.x, global_position.y)
		podeatirar = false
	pass


func _on_timer_timeout():
	podeatirar = true
	pass # Replace with function body.
