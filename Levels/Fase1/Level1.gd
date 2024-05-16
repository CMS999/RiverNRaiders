extends Node2D

@onready var GlobalReference = get_node("/root/GlobalValues")

func _ready():
	var Projeteis = Node2D.new()
	Projeteis.set_name("Particulas")
	get_tree().root.add_child(Projeteis)

	GlobalReference.JogadorRef = $Jogador
	pass

func _unhandled_input(event):
	if event.is_action_pressed("Pausar"):
		$PauseMenu.show()
		$PauseMenu/Voltar.grab_focus()
		get_tree().paused = true

func _on_final_da_fase_timeout():
	get_tree().change_scene_to_file("res://UI/DeathMenu.tscn")
	pass 

