extends Node2D
var segundo : int
var minuto : int
var hora : int
@export var inimigo1 : PackedScene
@export var test : Array[PackedScene]
var mob
# Called when the node enters the scene tree for the first time.
func _ready():
	'mob = inimigo1.instantiate()
	mob.get_node("SpriteSheet").flip_h = true
	mob.get_node("SpriteSheet").play("flight")
	mob.set_name("aren")
	add_child(mob)'
	var Projeteis = Node2D.new()
	Projeteis.set_name("Particulas")
	get_tree().root.add_child(Projeteis)
	pass

func _process(delta):
	if Input.is_action_pressed("Pausar"):
		get_node("PauseMenu").show()
		get_tree().paused = true
	pass

func _on_clock_timeout():
	segundo += 1
	if segundo == 60:
		segundo = 0
		minuto += 1

	if minuto == 60:
		minuto = 0
		hora += 1
	pass

func _on_final_da_fase_timeout():
	get_tree().change_scene_to_file("res://UI/DeathMenu.tscn")
	pass 

func _on_spawner_timeout():
	pass 
