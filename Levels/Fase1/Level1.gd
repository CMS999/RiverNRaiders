extends Level

func _ready():
	InicializarLevel()
	GlobalReference.JogadorRef = $Jogador
	$Jogador.setPowerUp(GlobalReference.PowerUpAtual)
	pass





