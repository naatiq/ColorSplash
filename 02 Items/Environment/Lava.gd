extends Area2D

func _ready():
	$Timer.start()

func _process(delta):
	if $Timer.time_left == 0:
		queue_free()


func _on_Lava_area_entered(area):
	if area.name == "Player":
		area.queue_free()
		get_tree().change_scene("res://06 UI/GameOver.tscn")


func _on_Slime_area_entered(area):
	if area.name == "Player":
		area.queue_free()
		get_tree().change_scene("res://06 UI/GameOver.tscn")


func _on_Ice_area_entered(area):
	if area.name == "Player":
			area.queue_free()
			get_tree().change_scene("res://06 UI/GameOver.tscn")
