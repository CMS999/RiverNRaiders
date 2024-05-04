class_name Ataque
var dano : int
var cooldown: int

func DarDano(test: Ataque, VidaAtual: VidaComponente):
	VidaAtual.VidaAtual -= test.dano
	pass