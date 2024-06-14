extends Polygon2D

@onready var Global = get_node("/root/GlobalValues")
# Called when the node enters the scene tree for the first time.
func _ready():
	$VidaArma.connect("Morto", self.Explode)
	$Timer.connect("timeout", self.timeout)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	look_at(Global.JogadorRef.position)
	pass


func timeout():
	$AtaqueComp.Ataque($Tip.global_position.x, $Tip.global_position.y)
	pass 

func Explode():
	queue_free()