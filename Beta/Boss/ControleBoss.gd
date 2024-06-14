extends Polygon2D

@export var Inimigo1 : PackedScene = null
@export var Inimigo2 : PackedScene = null


func _ready():
	$VidaComp.connect("Morto", self.Explode)
	$Timer.connect("timeout", self.Deploy)
	pass

func _process(delta):
	pass

func Explode():
	queue_free()

func Deploy():
	var inimigo = randi_range(1,2)
	if inimigo == 1:
		var novoInimigo = Inimigo1.instantiate()
		add_child(novoInimigo)
	elif inimigo == 2:
		var novoInimigo = Inimigo2.instantiate()
		novoInimigo.instantiate()
		add_child(novoInimigo)
	pass
