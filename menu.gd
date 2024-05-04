extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_p_button_pressed():
	get_tree().change_scene_to_file("res://Levels/Level1.tscn")
	pass # Replace with function body.


func _on_s_button_pressed():
	get_tree().quit()
	pass # Replace with function body.


func _on_op_button_pressed():
	pass # Replace with function body.
