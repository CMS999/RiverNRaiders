extends Polygon2D

var Inimigo1 = preload("res://Inimigos/Helicoptero.tscn")
var Inimigo2 = preload("res://Inimigos/Aviao.tscn")
var Mover = preload("res://Componentes/Waves/auto_mover.tscn")
@export var Corpo : Polygon2D

func _ready():
	Corpo.connect("PartDestroyed", self.Improve)
	$VidaComp.connect("Morto", self.Explode)
	$Timer.connect("timeout", self.Deploy)
	pass

func Explode():
	$HitboxComp/CollisionPolygon2D.disabled = true;
	Corpo.explode()
	queue_free()

func Improve():
	$Timer.wait_time *= 0.8

func Deploy():
	var inimigo = randi_range(1,2)
	var novoMover = Mover.instantiate()
	var novoInimigo
	if inimigo == 1:
		novoInimigo = Inimigo1.instantiate()
		
	elif inimigo == 2:
		novoInimigo = Inimigo2.instantiate()
	
	novoMover.add_child(novoInimigo)
	$Path2D.add_child(novoMover)
