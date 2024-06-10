extends Level


func _ready():
	if MundoDaFase:
		MundoDaFase.connect("FimDoMundo", self.FimDaFase)
	CriarParticulas()
	GlobalREF.JogadorRef = $Jogador
	pass





