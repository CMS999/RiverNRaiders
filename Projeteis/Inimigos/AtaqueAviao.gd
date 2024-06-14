extends ProjetilComp

@onready var GlobalReference = get_node("/root/GlobalValues")
var Alvo 
var Direcao :Vector2 = Vector2(1,0)
var flag :bool= true

func _ready():
	Alvo = GlobalReference.JogadorRef
	pass

func Direc():
	if Alvo != null:
		var Direcao = Vector2(cos(rotation), sin(rotation))
	pass

func _process(delta):	
	if flag:
		Direc()
		flag = false
	position += Direcao * delta * Velocidade
	pass
