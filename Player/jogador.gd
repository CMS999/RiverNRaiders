extends CharacterBody2D
@onready var screensize = get_viewport_rect().size
const SPEED = 150.0
var podeAtirar := true
signal test
# Get the gravity from the project settings to be synced with RigidBody nodes.
#var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func _physics_process(_delta):
	if $VidaComponente.VidaAtual <= 0:
		get_tree().change_scene_to_file("res://UI/DeathMenu.tscn")


	var directionX = Input.get_axis("esq", "dir")
	var directionY = Input.get_axis("cima", "baixo")
	if directionX > 0:
		get_node("Animação").play("direita")
		velocity.x = directionX * SPEED
	elif directionX < 0:
		get_node("Animação").play("esquerda")
		velocity.x = directionX * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		get_node("Animação").play("idle")
	if directionY:
		velocity.y = directionY * SPEED
	else:
		velocity.y = move_toward(velocity.y, 0, SPEED)
	move_and_slide()		

	if Input.is_action_pressed("tiro"):
		if podeAtirar:
			get_node("AtaqueComponente").Ataque(position.x-8,position.y)
			get_node("AtaqueComponente").Ataque(position.x+8,position.y)
			#podeAtirar = false
		
	position = position.clamp(Vector2(8, 8), screensize-Vector2(8, 8))

