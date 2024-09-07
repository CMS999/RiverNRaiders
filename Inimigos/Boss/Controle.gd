extends Node2D

@onready var GlobalReference = get_node("/root/GlobalValues")
var Inimigo1 = preload("res://Inimigos/Helicoptero.tscn")
var mover1 = preload("res://Inimigos/Boss/enemyBMover.tscn")
#var Mover = preload("res://Componentes/Waves/auto_mover.tscn")
var Mover : Array[PathFollow2D] = []
@export var Corpo : AnimatedSprite2D
var enemiesOnTrack := 0

func _ready():
	Corpo.connect("PartDestroyed", self.Improve)
	$VidaComp.connect("Morto", self.Explode)
	$Timer.connect("timeout", self.Deploy)
	pass

func Explode():
	$HitboxComp/CollisionPolygon2D.set_deferred("disabled", true)
	Corpo.explode()
	queue_free()

func Improve():
	$Timer.wait_time *= 0.8

func Deploy():
	if enemiesOnTrack < 3:
		var novoInimigo = Inimigo1.instantiate()
		novoInimigo.connect("enemy_destroyed", self.enemyDestroyed)
		var novoMover = mover1.instantiate()
		novoMover.setSpeed(0.15)
		novoMover.add_child(novoInimigo)
		$Path1.add_child(novoMover)
		enemiesOnTrack += 1;

func enemyDestroyed():
	enemiesOnTrack -= 1;