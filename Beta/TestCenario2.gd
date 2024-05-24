extends Node2D

var rng = RandomNumberGenerator.new()
@onready var Tilemap1 = $TileMap
@onready var Tileset1 = Tilemap1.tile_set
@onready var Tilemap2 = $TileMap2
@onready var Tileset2 = Tilemap2.tile_set
var InicialPosition = Vector2(0,0)

func _ready():
	pass

func _process(delta):
	if Tilemap1.position.y >= 320:
		Tilemap1.visible = false
		Tilemap1.position.y = -319
		CriarChunk(0,0, Tileset1, Tilemap1)
		Tilemap1.visible = true
	else:
		Tilemap1.position.y += int(delta * 100)

	if Tilemap2.position.y >= 640:
		Tilemap2.visible = false
		Tilemap2.position.y = 1
		CriarChunk(-20,0, Tileset2, Tilemap2)
		Tilemap2.visible = true
	else:
		Tilemap2.position.y += int(delta * 100)
	
	
	pass

func CriarChunk(offset: int, pattern: int, tileset: TileSet, tilemap: TileMap):
	InicialPosition.y = offset
	tilemap.set_pattern(0,InicialPosition,tileset.get_pattern(pattern))
	pass
