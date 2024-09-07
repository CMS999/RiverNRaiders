extends Inimigo
class_name AviGrande

# Variáveis para controlar os tiros
var shoot_count : int = 0
var max_shots : int = 1
var posso := true

func _process(_delta):
	pontos = 500
	if $AtaqueComp.projetil and pode_atirar and Alvo != null and vivo:
		
		
		posso = true
		
		pode_atirar = false
		
		fire_timer.start()


func transiton():
	if vivo:
		animacoes.stop();
		animacoes.play("transition");

func AniFinish():
	if !vivo:
		GlobalReference.pontuacao += 10000
		enemy_destroyed.emit()
		animacoes.disconnect("animation_finished", self.AniFinish)
		queue_free()
	elif vivo:
		animacoes.play("standing")

func _on_shoot_delay_timeout():
	if posso:
		$AtaqueComp.Ataque(global_position.x, global_position.y)
		shoot_count += 1

		if shoot_count == max_shots:
			posso = false
			shoot_count = 0
			max_shots += 1

		if max_shots == 4:
			shoot_count = 0
			max_shots = 1
	pass
