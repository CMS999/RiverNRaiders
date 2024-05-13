extends Control

func _on_p_button_pressed():
	get_tree().change_scene_to_file("res://Levels/Level1.tscn")
	pass # Replace with function body.


func _on_s_button_pressed():
	get_tree().quit()
	pass # Replace with function body.


func _on_op_button_pressed():
	pass # Replace with function body.
