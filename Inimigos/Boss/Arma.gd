extends AnimatedSprite2D

@onready var Global = get_node("/root/GlobalValues")
@export var Corpo : AnimatedSprite2D
var vivo := true


func _ready():
	self.connect("animation_finished", self.AniFinish)

	Corpo.connect("PartDestroyed", self.Improve)
	$VidaArma.connect("Morto", self.Explode)
	$Timer.connect("timeout", self.timeout)
	pass 


func _process(_delta):
	if vivo:
		look_at((Global.JogadorRef.position))
		rotation_degrees+=-90
	pass

func Improve():
	$Timer.wait_time *= 0.8

func timeout():
	if vivo:
		$AtaqueComp.Ataque($Tip.global_position.x, $Tip.global_position.y)
	pass 

func Explode():
	$HitboxComp/CollisionPolygon2D.set_deferred("disabled", true)
	Corpo.explode()
	if vivo:
		self.play("morte")
		vivo = false;
	

func AniFinish():
	queue_free()
