extends ProjetilComp

@onready var GlobalReference = get_node("/root/GlobalValues")
var Alvo 
var Direcao :Vector2 = Vector2(1,0)
var flag :bool= true
@export_range(-180,180) var rotacao: float

func _ready():
	Alvo = GlobalReference.JogadorRef
	rotacao = deg_to_rad(rotacao)

func _process(delta):	
	position += Vector2(0, 1).rotated(rotacao) * delta * Velocidade
