extends Node2D

func _ready():
	var Projeteis = Node2D.new()
	Projeteis.set_name("Particulas")
	get_tree().root.add_child(Projeteis)
	pass


func _unhandled_input(event):
	if event.is_action_pressed("Pausar"):
		$PauseMenu.show()
		get_tree().paused = true

func _on_final_da_fase_timeout():
	get_tree().change_scene_to_file("res://UI/DeathMenu.tscn")
	pass 

