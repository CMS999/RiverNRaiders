extends Level

@export var JogadorHitBox := true
@export var JogadorVida := 10
@export var JogadorSpeed := 150

func _ready():
	GlobalReference.PowerUpAtual = GlobalReference.PowerUps[1]
	super()
	SetJogador()
	
func SetJogador():
	Jogador1.Speed = JogadorSpeed
	Jogador1.get_node("VidaComponente").VidaAtual = JogadorVida
	Jogador1.get_node("VidaComponente").VidaMaxima = JogadorVida
	Jogador1.get_node("HurtboxComponente").set_process(JogadorHitBox)
