extends Area2D

func _ready():
	get_node ("CollisionShape2D").set_disabled(true)

func _process(delta):
	if get_parent().get_node("YellowSwitch").switch_status_get() :
		if get_parent().get_node("GreenSwitch").switch_status_get():
			if get_parent().get_node("BlueSwitch").switch_status_get():
				show()
				get_node ("CollisionShape2D").set_disabled(false)

func _on_Exit_area_entered(area):
	get_tree().change_scene("res://06 UI/LevelComplete.tscn")
