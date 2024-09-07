extends ProjetilComp
@onready var Animacao = $AnimacaoPlayer
@onready var audio_player = $AudioStreamPlayer
@export var volume: float = -10
var exploded := false
func _ready():
	audio_player.volume_db = volume
	$Animacao.play("Missel")
	#Animacao.play("Missel")
	$ExplosaoTimer.start()
	$Desaparecer.start()
	pass # Replace with function body.

func _process(delta):
	position -= Vector2(0, 1).rotated(0) * delta * Velocidade
	if exploded and scale.x <= 3.7:
		scale.x += 5 * delta
		scale.y += 5 * delta
	pass

func _on_area_entered(area:Area2D):
	if area is HitboxComp:
		area.Hit(Dano)
		explosao()


func _on_desaparecer_timeout():
	queue_free()


func _on_explosao_timer_timeout():
	explosao()

func explosao():
	if !exploded:
		$Animacao.play("Explosao")
		exploded = true
		Velocidade = 0
		audio_player.play()
	
