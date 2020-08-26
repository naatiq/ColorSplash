extends Node2D

var switch_status = false setget, switch_status_get

signal switch_activated(status)
func _ready():
	pass

func _process(delta):
	pass


func _on_Switch_area_entered(area):
	if(area.name == "Player"): 
		change_status()
		

func change_status():
	switch_status = not switch_status
	if switch_status == false:
		$Status.set_text("D")
		emit_signal("switch_activated", false)
	else:
		$Status.set_text("A")
		emit_signal("switch_activated", true)
		

func switch_status_get():
	return switch_status
