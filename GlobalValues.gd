extends Node

@onready var FaseInicial = preload("res://Levels/Fase1/Level1.tscn")
var JogadorRef := Node
var VidasInicias := 1
var PowerUps = {
1:"TiroTriplo",
2:"SuperMissil"
}
var PowerUpAtual = ""
