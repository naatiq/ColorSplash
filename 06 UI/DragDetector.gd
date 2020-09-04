extends Node

signal dragged(direction)
signal drag_eng()

func _input(event):
	if not event is InputEventScreenDrag:	
		return
	if event.type == InputEvent.SCREEN_TOUCH:
		if event.is_pressed():
			print('dragging')
		else:
			print('not dragging') 
