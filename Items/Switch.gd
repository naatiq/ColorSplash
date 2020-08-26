extends Node2D

var switch_status = false setget, switch_status_get

func _ready():
	pass

func _process(delta):
	change_status()


func _on_Switch_area_entered(area):
	if(area.name == "Player"): 
		 switch_status = not switch_status

func change_status():
	if switch_status == false:
		$Status.set_text("D")
	else:
		$Status.set_text("A")
		

func switch_status_get():
	return switch_status
