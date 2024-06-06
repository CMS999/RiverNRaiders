extends ProjetilComp

var test 
var nera = true
var nera1 := Vector2(0,0)

func playerPosi():
	test = get_node("/root/Level1/Jogador")
	if test != null:
		nera1 = Vector2(1,0).rotated(global_position.direction_to(test.position).angle()).normalized()
	pass

func _ready():
	pass

func _process(delta):
	if nera:
		playerPosi()
		nera = false
	
	position += nera1 * delta * Velocidade*1.1
	pass
