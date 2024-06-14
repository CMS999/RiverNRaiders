extends Node
## Referência à valores utilizados em várias porções do código
## Apenas armazena vários valores de forma a facilitar o acesso deles por vários componentes

@onready var FaseInicial = preload("res://Levels/Fase1/Level1.tscn") 
var JogadorRef := Node ## Variável que aponta para o [Jogador]
var VidasIniciais := 1 ## Variável que armazena as vidas iniciais
## Dicionário que contém todos os powerups
var PowerUps = {
	1:"TiroMulti",
	2:"SuperMissil",
	3:"Escudo"
}
## PowerUp escolhido pelo [Jogador].
var PowerUpAtual : String = ""
## Total de energia do jogador, inicialmente também é o valor atual dela.
var barraEnergia : int = 40
