extends Node2D
class_name Level
@onready var GlobalREF = get_node("/root/GlobalValues")
@export var MundoDaFase : Mundo

func _unhandled_input(event):
	if event.is_action_pressed("Pausar"):
		$Pause/PauseMenu.show()
		$Pause/PauseMenu/Vbox/Voltar.grab_focus()
		get_tree().paused = true

func CriarParticulas() -> void:
	var Projeteis = Node2D.new()
	Projeteis.set_name("Particulas")
	get_tree().root.add_child(Projeteis)

func FimDaFase() -> void:
	get_tree().root.get_node("Particulas").queue_free()
	get_tree().change_scene_to_file("res://UI/TelaVitoria.tscn")