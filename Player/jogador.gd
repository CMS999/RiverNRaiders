extends CharacterBody2D
@export var bullet_scene : PackedScene
@onready var screensize = get_viewport_rect().size
const SPEED = 150.0
var podeAtirar := true


# Get the gravity from the project settings to be synced with RigidBody nodes.
#var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")


func _physics_process(delta):
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

	if Input.is_action_pressed("Pausar"):
		get_parent().get_node("PauseMenu").show()
		get_tree().paused = true
		

	if Input.is_action_pressed("tiro"):
		if podeAtirar:
			var bala1 = bullet_scene.instantiate()
			var bala4 = bullet_scene.instantiate()
			get_tree().root.add_child(bala1)
			get_tree().root.add_child(bala4)
			
			bala1.get_node("TipoBala").start(position)
			bala4.get_node("TipoBala").start(position)

			bala1.position.x -= 8 
			bala4.position.x +=  8 
			podeAtirar = false

	position = position.clamp(Vector2(8, 8), screensize-Vector2(8, 8))


