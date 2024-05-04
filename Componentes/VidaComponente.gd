extends Node2D
class_name VidaComponente

@export var VidaMaxima:= 10
var VidaAtual : int

# Called when the node enters the scene tree for the first time.
func _ready():
	VidaAtual = VidaMaxima