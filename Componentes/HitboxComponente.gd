extends Area2D

@export var Vida : VidaComponente

func damage(ataque: Ataque):
	Vida.VidaAtual -= ataque.dano
	if(Vida.VidaAtual <= 0):
		get_parent().queue_free()

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass



