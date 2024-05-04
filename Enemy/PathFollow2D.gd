extends PathFollow2D
var inimigo1 = preload("res://Enemy/heli2.tscn")
var mob
# Called when the node enters the scene tree for the first time.
func _ready():
	mob = inimigo1.instantiate()
	mob.get_node("Voo").flip_h = true
	add_child(mob)
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if(mob != null):
		progress_ratio += delta * 0.1
		mob.get_node("Voo").play("flight")
		if(progress_ratio == 1):
			mob.queue_free()
	pass
