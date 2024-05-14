extends Node
class_name Waves

## Tempo de espera entre os spawns das waves
@export_range(1,60) var TimePerWave := 1

## Tempo de espera entre os spawns dos inimigos
@export_range(0,1) var InimigoDelay := 0.4

var MoverScene := preload("res://Componentes/Waves/auto_mover.tscn")
var TodasWaves : Array[Wave] = []
var WaveAtual := 0

func _ready():
	GETWaves()
	$WaveSpawn.wait_time = TimePerWave

func GETWaves() -> void:
	for i in get_children():
		if i is Wave:
			TodasWaves.append(i)

func SpawnWaveX(Spawn: Wave) -> void:
	if Spawn.Inimigos and Spawn.Quantidade and Spawn.LocalizacaoSpawn:
		for C in Spawn.Inimigos.size():
			for A in Spawn.Quantidade[C]:
				var inimigo = Spawn.Inimigos[C].instantiate()
				var caminho = MoverScene.instantiate()
				Spawn.LocalizacaoSpawn[C].add_child(caminho)
				caminho.add_child(inimigo)
				await get_tree().create_timer(InimigoDelay).timeout
	else:
		push_error("Um dos arrays do node Wave não foi iniciado apropriadamente")
	

func _on_wave_spawn_timeout() -> void:
	if WaveAtual < TodasWaves.size():
		SpawnWaveX(TodasWaves[WaveAtual])
		WaveAtual += 1

