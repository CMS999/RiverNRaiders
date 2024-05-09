extends Area2D
class_name ProjetilComp

## Velocidade inicial do projétil
@export var Velocidade := 120

## Dano do projétil
@export var Dano := 1

func _ready():
	pass

func start(iniPosition):
	position = iniPosition

func _on_visible_on_screen_notifier_2d_screen_exited():
	get_parent().queue_free()

func _on_area_entered(area:Area2D):
	if area is HitboxComp:
		area.Hit(Dano)
	pass
