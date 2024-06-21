extends Area2D

@export var explosao_radius: float = 50.0
@export var dano_explosao: int = 10

func _ready():
	# Adiciona o formato de colisão da área de explosão
	var collision_shape = CollisionShape2D.new()
	var shape = CircleShape2D.new()
	shape.radius = explosao_radius
	collision_shape.shape = shape
	add_child(collision_shape)

	# Configura a área para detectar colisões, mas não interagir fisicamente
	var area = Area2D.new()
	area.name = "ExplosaoArea"
	area.collision_layer = 0  # Configurar conforme suas camadas de colisão
	area.collision_mask = 0   # Configurar conforme suas máscaras de colisão
	area.monitoring = true    # Permite que a área detecte colisões
	add_child(area)

	# Configura um timer para destruir automaticamente a explosão após um curto período
	var timer = Timer.new()
	timer.one_shot = true
	timer.wait_time = 0.1  # Tempo de espera antes de destruir a explosão (ajuste conforme necessário)
	add_child(timer)
	timer.start()
	$Timer.connect("timeout", self._on_timer_timeout)

func _on_timer_timeout():
	queue_free()  # Libera a área de explosão quando o timer expira
