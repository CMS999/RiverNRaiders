extends Node2D
## Node que oferece métedos para realizar ataques de projéteis
class_name PowerUpComp

## Define o projétil a ser atirado
@export var projetil : PackedScene
var powerUp : String

func setPowerUp(powerUpId: String):
	powerUp = powerUpId
	if powerUp == "SuperMissil":
		projetil = preload("res://Projeteis/Jogador/Missel.tscn")
	elif powerUp == "TiroTriplo":
		projetil = preload("res://Projeteis/Jogador/TiroTriplo.tscn")
		

func Action(PositionX: float, PositionY: float) -> void:
	if powerUp == "Escudo":
		pass
	else:
		Ataque(PositionX,PositionY)

func Ataque(PositionX: float, PositionY: float):
	print(projetil)
	var bullet = projetil.instantiate()
	var PositionGlobal : Vector2
	PositionGlobal.x = PositionX
	PositionGlobal.y = PositionY
	get_tree().root.get_node("Particulas").add_child(bullet)
	bullet.start(PositionGlobal)
