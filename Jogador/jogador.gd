extends CharacterBody2D
class_name Jogador

## Define velocidade de movimento do Jogador
@export var Speed := 200.0

@onready var screensize = get_viewport_rect().size
@onready var Animações := $Animação

enum Estado{parado,	morto, movendo}
var estadoAtual : Estado= Estado.parado
var estaVivo : bool= true
#var tiroTriplo : bool = false
var podeAtirar : bool = true
#var misselExplosivo: bool = false
var componenteAtaque: Node
var powerUpId : String
var barraEnergia : int = 40

func _ready():
	$VidaComponente.connect("Morto", self.is_vivo)
	pass
	
func setPowerUp(powerUpId: String):
	powerUpId = powerUpId
	$PowerUpComponente.setPowerUp(powerUpId)

func _physics_process(_delta):
	var directionX = Input.get_axis("esq", "dir")	
	var directionY = Input.get_axis("cima", "baixo")
	
	# Very ugly State Machine
	if !estaVivo:
		estadoAtual = Estado.morto
	elif directionX != 0 or directionY != 0:
		estadoAtual = Estado.movendo
	elif directionX == 0 and directionY == 0:
		estadoAtual = Estado.parado
	
	if estadoAtual == Estado.movendo:
		velocity.y = directionY * Speed
		velocity.x = directionX * Speed
		if directionX > 0:
			Animações.play("direita")		
		elif directionX < 0:
			Animações.play("esquerda")		
		move_and_slide()
	elif estadoAtual == Estado.parado:
		Animações.play("idle")
		velocity = Vector2(0,0)	
	elif estadoAtual == Estado.morto:
		Animações.play("morte")
		await get_tree().create_timer(1).timeout
		get_tree().change_scene_to_file("res://UI/DeathMenu.tscn")
	
	if Input.is_action_pressed("tiro") and podeAtirar:
		get_node("AtaqueComponente").Ataque(position.x,position.y)
		#if misselExplosivo:
		#	componenteAtaque = get_node("MisselComponente")
		#else:	
		#	componenteAtaque = get_node("AtaqueComponente")
		#componenteAtaque.Ataque(position.x,position.y)
		#if tiroTriplo:
		#	componenteAtaque.Ataque(position.x+10,position.y)
		#	componenteAtaque.Ataque(position.x-10,position.y)
			
		podeAtirar = false
		$AtaqueDelay.start()
	if Input.is_action_pressed("power"):
		$PowerUpComponente.Action(position.x,position.y)
	
	
	position = position.clamp(Vector2(8, 8), screensize-Vector2(8, 8))
	pass

func _on_ataque_delay_timeout():
	podeAtirar = true

#func _power_up(id: int) -> void:
	#if id == 0:
		#tiroTriplo = true
		#$TiroTriploDelay.start()
	#elif id == 2:
		#misselExplosivo = true
		#$MisselExplosivoDelay.start()
	#pass

func is_vivo():
	estaVivo = false


#func _on_tiro_triplo_delay_timeout():
	#tiroTriplo = false
#
#
#func _on_missel_explosivo_delay_timeout():
	#misselExplosivo = false
