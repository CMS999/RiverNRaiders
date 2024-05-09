extends CharacterBody2D
@onready var screensize = get_viewport_rect().size

## Define velocidade de movimento do Jogador
@export var Speed = 150.0

var podeAtirar := true

func _physics_process(_delta):
	if $VidaComponente.VidaAtual <= 0:
		get_tree().change_scene_to_file("res://UI/DeathMenu.tscn")

	if Input.is_action_pressed("Pausar"):
			get_node("PauseMenu").show()
			get_tree().paused = true

	var directionX = Input.get_axis("esq", "dir")
	var directionY = Input.get_axis("cima", "baixo")
	
	if directionX > 0:
		get_node("Animação").play("direita")
		velocity.x = directionX * Speed
	elif directionX < 0:
		get_node("Animação").play("esquerda")
		velocity.x = directionX * Speed
	else:
		velocity.x = move_toward(velocity.x, 0, Speed)
		get_node("Animação").play("idle")
	if directionY:
		velocity.y = directionY * Speed
	else:
		velocity.y = move_toward(velocity.y, 0, Speed)
	move_and_slide()		

	if Input.is_action_pressed("tiro"):
		if podeAtirar:
			get_node("AtaqueComponente").Ataque(position.x-8,position.y)
			get_node("AtaqueComponente").Ataque(position.x+8,position.y)
			#podeAtirar = false
		
	position = position.clamp(Vector2(8, 8), screensize-Vector2(8, 8))

