extends Node2D
var cenario = preload("res://cenarioRR/scenes/parallaxbackground.tscn")
var test
# Called when the node enters the scene tree for the first time.
func _ready():
	test = cenario.instantiate()
	add_child(test)
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	pass
