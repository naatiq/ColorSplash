extends Node2D


func _ready():
	pass


func _on_Back_button_down():
	get_tree().change_scene("res://06 UI/Start.tscn")

func _on_Restart_button_down():
	get_tree().change_scene("res://03 Levels/Demo.tscn")
