extends Node2D
class_name Inimigo

@export var vida: int = 1
@export var velocidade: float = 0.15
@export var dano_colisao: int = 10
@export var fire_rate: float = 1.0



@onready var GlobalReference = get_node("/root/GlobalValues")
var Alvo 
var Direcao :Vector2 = Vector2(1,0)
var flag :bool= true

# Referências aos nós filhos
@onready var ataque_inimigo = $AtaqueInimigo
@onready var fire_timer = $FireTimer
@onready var ataque_comp = $AtaqueComp
@onready var vida_comp = $VidaComp
@onready var hurtbox_comp = $Hurtbox
@onready var animacoes = $Animações

# Sinal para quando o inimigo é destruído
signal enemy_destroyed

var pode_atirar: bool = true

func _ready():
	$Animações.flip_h = true
	Alvo = GlobalReference.JogadorRef
	$VidaComp.connect("Morto", self.morrer)
	$Timer.connect("timeout", self._on_timer_timeout)
	$Hurtbox.connect("area_entered", self._on_area_entered)
	$fire_timer.connect("timeout", self._on_timer_timeout)
	fire_timer.wait_time = fire_rate  # Configura o tempo de espera do Timer com o fire_rate
	fire_timer.start()  # Inicia o Timer
	
	

func _process(delta):
	if $AtaqueComp.projetil and pode_atirar and Alvo != null:
		$AtaqueComp.Ataque(global_position.x, global_position.y)
		pode_atirar = false
		fire_timer.start()
	pass


func morrer():
	if animacoes:
		animacoes.play("morte")
		$Animações.connect("animation_finished", self._on_morte_animacao_finalizada)
	else:
		queue_free()

func _on_morte_animacao_finalizada():
	emit_signal("inimigo_morto", self)
	queue_free()

func _on_area_entered(area):
	if area.has_method("receber_dano"):
		area.receber_dano(dano_colisao)
	vida_comp.Dano(vida_comp.VidaAtual)

func _on_fire_timeout():
	pode_atirar = true
