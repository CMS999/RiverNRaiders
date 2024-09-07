extends Node2D
class_name merdaPodre

signal bossIsDead

func _ready():
	$Corpo.connect("morri", self.morrer)

func morrer():
	bossIsDead.emit()


func _on_corpo_animation_finished():
	queue_free()
