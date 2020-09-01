extends Node2D


func _ready():
	pass


func _on_Start_button_down():
	get_tree().change_scene("res://03 Levels/Demo.tscn")


func _on_Settings_button_down():
	pass # Replace with function body.


func _on_Exit_button_down():
	get_tree().quit()
