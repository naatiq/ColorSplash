extends Node2D


func _ready():
	pass


func _on_Replay_button_down():
	get_tree().change_scene("res://03 Levels/Demo.tscn")


func _on_Next_button_down():
	pass # Replace with function body.


func _on_Back_button_down():
	get_tree().change_scene("res://06 UI/Start.tscn")
