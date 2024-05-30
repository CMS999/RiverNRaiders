extends Node2D
class_name Inimigo

@export var vida: int = 100
@export var velocidade: float = 100.0
@export var fire_rate: float = 1.0
@export var dano_colisao: int = 10

# Referências aos nós filhos
@onready var fire_timer = $FireTimer
@onready var ataque_comp = $AtaqueComp
@onready var vida_comp = $VidaComp
@onready var hurtbox_comp = $Hurtbox
@onready var animacoes = $Animações

# Sinal para quando o inimigo é destruído
signal enemy_destroyed

var pode_atirar: bool = true
var alvo : Node

func _ready():
	$VidaComp.connect("Morto", self.Morrer)
	$Timer.connect("timeout", self._on_timer_timeout)
	$Hurtbox.connect("area_entered", self._on_area_entered)
	fire_timer.wait_time = fire_rate  # Configura o tempo de espera do Timer com o fire_rate
	fire_timer.start()  # Inicia o Timer
	$fire_timer.connect("timeout", self._on_timer_timeout)

func _process(delta):
	position.y += velocidade * delta
	if position.y > get_viewport_rect().size.y:
		queue_free()

	if pode_atirar and ataque_comp.projetil:
		ataque_comp.Ataque(global_position.x, global_position.y)
		pode_atirar = false

func _on_timer_timeout():
	if pode_atirar and alvo != null:
		ataque_comp.Ataque(global_position.x, global_position.y)
		pode_atirar = false
		fire_timer.start()

func morrer():
	emit_signal("enemy_destroyed", self)
	queue_free()

func _on_area_entered(area):
	if area.has_method("receber_dano"):
		area.receber_dano(dano_colisao)
	vida_comp.Dano(vida_comp.VidaAtual)
