extends Node2D
class_name AviaoGrande

@export var vida: int = 5
@export var velocidade: float = 0.15
@export var dano_colisao: int = 10
@export var fire_rate: float = 0.7

@onready var GlobalReference = get_node("/root/GlobalValues")
var Alvo 
var Direcao: Vector2 = Vector2(1, 0)
var flag: bool = true
var vivo := true
var pode_atirar: bool = false

# Referências aos nós filhos
@onready var fire_timer = $Timer
@onready var ataque_comp = $AtaqueComp
@onready var vida_comp = $VidaComp
@onready var hurtbox_comp = $HitboxComp
@onready var animacoes = $AnimatedSprite2D

# Sinal para quando o inimigo é destruído
signal enemy_destroyed

# Variáveis para controlar os tiros
var shoot_count: int = 0
var max_shots: int = 3

func _ready():
	Alvo = GlobalReference.JogadorRef
	$VidaComp.connect("Morto", self.morrer)
	$Timer.connect("timeout", self.timeOUT)
	$HitboxComp.connect("area_entered", self._on_area_entered)
	$AnimatedSprite2D.connect("animation_finished", self.AniFinish)
	fire_timer.wait_time = fire_rate  # Configura o tempo de espera do Timer com o fire_rate
	fire_timer.start()  # Inicia o Timer
	
func _process(_delta):
	if $AtaqueComp.projetil and pode_atirar and Alvo != null and vivo:
		$AtaqueComp.Ataque(global_position.x, global_position.y)
		shoot_count += 1
		
		if shoot_count < max_shots:
			fire_timer.wait_time = 0.2  # Intervalo curto entre os tiros
		else:
			shoot_count = 0
			fire_timer.wait_time = fire_rate  # Volta ao intervalo original
			pode_atirar = false
		
		fire_timer.start()

func morrer():
	$HitboxComp/CollisionShape2D.set_deferred("disabled", true)
	if animacoes:
		animacoes.play("morte")
		vivo = false
	else:
		queue_free()

func AniFinish():
	GlobalReference.pontuacao += 10000
	emit_signal("enemy_destroyed", self)
	animacoes.disconnect("animation_finished", self.AniFinish)
	queue_free()

func _on_area_entered(area):
	if area.has_method("receber_dano"):
		# area.receber_dano(dano_colisao)
		pass
	# vida_comp.Dano(vida_comp.VidaAtual)

func timeOUT():
	pode_atirar = true


func _on_timer_timeout():
	pass # Replace with function body.
