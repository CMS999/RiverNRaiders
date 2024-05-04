extends Area2D
class_name ParticulaComponente

@export var Velocidade := 120
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func start(pos):
	position = pos

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position.y -= Velocidade * delta
	pass


func _on_visible_on_screen_notifier_2d_screen_exited():
	queue_free()
	pass # Replace with function body.


func _on_area_entered(area:Area2D):
	if area.has_method("damage"):
		var test = Ataque.new()
		test.dano = 1
		area.damage(test)
		print("teste")
	pass # Replace with function body.
