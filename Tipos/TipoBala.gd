extends Area2D
class_name TipoBala

@export var Velocidade := 120
@export var Dano := 1

var Bala : Ataque
# Called when the node enters the scene tree for the first time.
func _ready():
	Bala = Ataque.new()
	Bala.dano = Dano
	pass

func start(pos):
	position = pos

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position.y -= Velocidade * delta
	pass


func _on_visible_on_screen_notifier_2d_screen_exited():
	get_parent().queue_free()
	pass


func _on_area_entered(area:Area2D):
	if area is HitboxComp:
		var hitbox : HitboxComp = area
		hitbox.Hit(Bala)
	pass
