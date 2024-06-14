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
@onready var fire_timer = $Timer
@onready var ataque_comp = $AtaqueComp
@onready var vida_comp = $VidaComp
@onready var hurtbox_comp = $HitboxComp
@onready var animacoes = $AnimatedSprite2D

# Sinal para quando o inimigo é destruído
signal enemy_destroyed

var pode_atirar: bool = true

func _ready():
	Alvo = GlobalReference.JogadorRef
	$VidaComp.connect("Morto", self.morrer)
	$Timer.connect("timeout", self._on_timer_timeout)
	$HitboxComp.connect("area_entered", self._on_area_entered)
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
		$AnimatedSprite2D.connect("animation_finished", self._on_animated_sprite_2d_animation_finished)
	else:
		queue_free()

func _on_animated_sprite_2d_animation_finished():
	emit_signal("enemy_destroyed", self)
	animacoes.disconnect("animation_finished", self._on_animated_sprite_2d_animation_finished)
	queue_free()



func _on_area_entered(area):
	if area.has_method("receber_dano"):
		area.receber_dano(dano_colisao)
	vida_comp.Dano(vida_comp.VidaAtual)

func _on_timer_timeout():
	pode_atirar = true


