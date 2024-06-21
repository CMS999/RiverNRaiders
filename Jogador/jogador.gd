extends CharacterBody2D
class_name Jogador
##Classe principal do jogador
##Controla física, powerups, se está vivo, se pode atirar

## Define velocidade de movimento do Jogador
@export var Speed : float = 200.0

## Variável utilizada para ajustar o jogador na tela
@onready var screensize = get_viewport_rect().size

## Controla as animações dos sprites
@onready var Animacoes := $Animacao
@onready var Escudo := $escudo

##Estados do jogador para definir comportamento [br]
##[b]Parado:[/b] Não faz nada, apenas mantém a animação original. [br]
##[b]Morto:[/b] Estado de fim de jogo, toca animação de morte e vai para o menu de derrota. [br]
##[b]Movendo:[/b] Toca animações de movimento, dependendo da direção do jogador.
enum Estado{parado,	morto, movendo,esperando,respawnando}

## Estado no qual o jogador está
var estadoAtual : Estado= Estado.parado

## Diz se o jogador está vivo
var estaVivo : bool= true

## Diz se é permitido usar o [AtaqueComp]
var podeAtirar : bool = true

## Diz se é permitido utilizar o [PowerUpComp]
var podePowerUp : bool = true

## Componente responsável por controlar o ataque principal
@onready var componenteAtaque: AtaqueComponente = $AtaqueComponente

## PowerUp atual do jogador
var powerUp : String

@onready var GlobalReference = get_node("/root/GlobalValues")

var temEscudo : bool = false

func _ready():
	$VidaComponente.connect("Morto", self.not_vivo)
	#$Teste.start()
	pass
	
## Função responsável por definir o powerup do jogador
func setPowerUp(powerUpId: String) -> void:
	powerUp = powerUpId
	$PowerUpComponente.setPowerUp(powerUp)

func _physics_process(_delta):
	GlobalReference.pontuacao += 60 *_delta
	var directionX = Input.get_axis("esq", "dir")	
	var directionY = Input.get_axis("cima", "baixo")
	
	# Very ugly State Machine
	if estadoAtual != Estado.respawnando:
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
			Animacoes.play("direita")		
		elif directionX < 0:
			Animacoes.play("esquerda")		
		move_and_slide()
	elif estadoAtual == Estado.parado:
		Animacoes.play("idle")
		velocity = Vector2(0,0)	
	elif estadoAtual == Estado.morto:
		if GlobalReference.vidas <1:
			Animacoes.play("morte")
			await get_tree().create_timer(1).timeout
			get_tree().change_scene_to_file("res://UI/DeathMenu.tscn")
			GlobalReference.pontuacao /= 2
		else:
			Animacoes.play("morte")
			$RespawnDelay.start()
			estadoAtual = Estado.respawnando
			estaVivo = true
			GlobalReference.vidas -= 1
	elif estadoAtual == Estado.respawnando:
		Animacoes.play("respawn")	
		$VidaComponente.comEscudo()
		
	if Input.is_action_pressed("tiro") and podeAtirar:
		if GlobalReference.barraEnergia <10:
			componenteAtaque.Ataque(position.x,position.y)
		elif GlobalReference.barraEnergia <30:
			componenteAtaque.Ataque(position.x + 8, position.y)
			componenteAtaque.Ataque(position.x - 8, position.y)
		else:
			componenteAtaque.Ataque(position.x, position.y)
			componenteAtaque.Ataque(position.x + 10, position.y)
			componenteAtaque.Ataque(position.x - 10, position.y)
		podeAtirar = false
		$AtaqueDelay.start()
	if Input.is_action_pressed("power") and podePowerUp:
		if powerUp == "Escudo":
			if GlobalReference.barraEnergia > 0:
				$VidaComponente.comEscudo()
				Escudo.show()
			else:
				Escudo.hide()
				$VidaComponente.semEscudo()
		$PowerUpComponente.Action(position.x,position.y,_delta)
		$PowerUpDelay.start()
		podePowerUp = false
	if Input.is_action_just_released("power"):
		if powerUp == "Escudo":
			$VidaComponente.semEscudo()
			Escudo.hide()
	position = position.clamp(Vector2(8, 8), screensize-Vector2(8, 8))
	pass

## Delay do tiro
func _on_ataque_delay_timeout() -> void:
	podeAtirar = true
	
## Matar o jogador
func not_vivo() -> void:
	estaVivo = false
## Delay do powerup
func _on_power_up_delay_timeout() -> void:
	podePowerUp = true


func _on_respawn_delay_timeout():
	estadoAtual = Estado.parado
	$VidaComponente.semEscudo()
	pass # Replace with function body.


func _on_teste_timeout():
	self.not_vivo()
	pass # Replace with function body.
