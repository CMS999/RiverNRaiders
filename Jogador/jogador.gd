extends CharacterBody2D
class_name Jogador

## Define velocidade de movimento do Jogador
@export var Speed := 150.0

@onready var screensize = get_viewport_rect().size
@onready var Animações := $Animação

enum Estado{parado,	morto, movendo}
var EstadoAtual := Estado.parado
var EstaVivo := true

var podeAtirar := true

func _ready():
	$VidaComponente.connect("Morto", self.Is_vivo)
	pass

func _physics_process(_delta):
	var directionX = Input.get_axis("esq", "dir")	
	var directionY = Input.get_axis("cima", "baixo")

	# Very ugly State Machine
	if !EstaVivo:
		EstadoAtual = Estado.morto
	elif directionX != 0 or directionY != 0:
		EstadoAtual = Estado.movendo
	elif directionX == 0 and directionY == 0:
		EstadoAtual = Estado.parado
	
	if EstadoAtual == Estado.movendo:
		if directionY:
			velocity.y = directionY * Speed

		if directionX > 0:
			Animações.play("direita")
			velocity.x = directionX * Speed
		elif directionX < 0:
			Animações.play("esquerda")
			velocity.x = directionX * Speed			
		move_and_slide()
	elif EstadoAtual == Estado.parado:
		Animações.play("idle")
		velocity = Vector2(0,0)	
	elif EstadoAtual == Estado.morto:
		Animações.play("morte")
		await get_tree().create_timer(1).timeout
		get_tree().change_scene_to_file("res://UI/DeathMenu.tscn")
	
	if Input.is_action_pressed("tiro") and podeAtirar:
		get_node("AtaqueComponente").Ataque(position.x-8,position.y)
		get_node("AtaqueComponente").Ataque(position.x+8,position.y)
		podeAtirar = false
		$AtaqueDelay.start()
	
	position = position.clamp(Vector2(8, 8), screensize-Vector2(8, 8))
	pass

func _on_ataque_delay_timeout():
	podeAtirar = true

func Is_vivo():
	EstaVivo = false