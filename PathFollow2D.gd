extends PathFollow2D
var inimigo1 = preload("res://Enemy/Inimigo1.tscn")
var mob
# Called when the node enters the scene tree for the first time.
func _ready():
	mob = inimigo1.instantiate()
	add_child(mob)
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	progress_ratio += delta * 0.1
	if(progress_ratio == 1 && mob != null):
		mob.queue_free()
	pass
