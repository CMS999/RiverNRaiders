extends Node2D

@onready var GlobalReference = get_node("/root/GlobalValues")

func _ready():
	if $Mundo:
		$Mundo.connect("FimDoMundo", self.FimDaFase)
	CriarParticulas()
	GlobalReference.JogadorRef = $Jogador
	pass

func _unhandled_input(event):
	if event.is_action_pressed("Pausar"):
		$PauseMenu.show()
		$PauseMenu/Voltar.grab_focus()
		get_tree().paused = true

func CriarParticulas() -> void:
	var Projeteis = Node2D.new()
	Projeteis.set_name("Particulas")
	get_tree().root.add_child(Projeteis)

func FimDaFase() -> void:
	get_tree().root.get_node("Particulas").queue_free()
	get_tree().change_scene_to_file("res://UI/TelaVitoria.tscn")