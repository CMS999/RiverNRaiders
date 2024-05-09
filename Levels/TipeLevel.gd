extends Node2D
class_name Level

@export var inimigos : Array[PackedScene]
@export var poderes : Array[PackedScene]

func _ready():
	var Projeteis = Node2D.new()
	Projeteis.set_name("Particulas")
	get_tree().root.add_child(Projeteis)
	pass


func _process(_delta):
	if Input.is_action_pressed("Pausar"):
			get_node("PauseMenu").show()
			get_tree().paused = true
	pass




