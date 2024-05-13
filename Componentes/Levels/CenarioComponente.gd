extends ParallaxBackground
## Node que oferece funcionalidades básicas para ParralaxBackground. É necessário adicionar nodes ParralaxLayer e Sprite2D
class_name CenarioComp

## Define coeficiente de velocidade de scroll do cénario
@export var Velocidade := 1

func _process(delta):
	scroll_base_offset += Vector2(0,70) * delta * Velocidade
	pass
