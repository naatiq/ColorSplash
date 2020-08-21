extends Area2D


func _ready():
	pass


func _on_Trap_area_entered(area):
	if area.name.find("Enemy") != -1:
		area.queue_free() # Replace with function body.
