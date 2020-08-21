extends Area2D

var tile_size = 128
var inputs = {"right": Vector2.RIGHT,
			"left": Vector2.LEFT,
			"up": Vector2.UP,
			"down": Vector2.DOWN}
var count = 0


func _on_Player_moved(direc):
	if count > 5:
		count = 0
	if count < 3 :
		position += Vector2.DOWN * tile_size
	else:
		position += Vector2.UP * tile_size
	count += 1


