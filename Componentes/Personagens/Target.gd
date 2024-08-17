extends Node2D
class_name Target

@export var tracking_time: float = 3.0
@export var delay_before_explosion: float = 1.5
@export var explosao_scene = preload("res://Componentes/Personagens/Explosao.tscn")

@onready var tracking_timer = $Timer
@onready var delay_timer = $ExplosaoTimer
@onready var sprite = $Sprite2D
var jogador

func _ready():
	tracking_timer.wait_time = tracking_time
	tracking_timer.start()
	tracking_timer.connect("timeout", self._on_tracking_timeout)

	delay_timer.wait_time = delay_before_explosion
	delay_timer.connect("timeout", self._on_delay_timeout)

func start_tracking(target):
	jogador = target
	set_process(true)

func _process(_delta):
	if jogador != null:
		position = jogador.global_position

func _on_tracking_timeout():
	set_process(false)
	delay_timer.start()

func _on_delay_timeout():
	var explosao = explosao_scene.instantiate()
	explosao.position = position
	get_parent().add_child(explosao)
	queue_free()
