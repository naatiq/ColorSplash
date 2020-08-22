extends Area2D

var tile_size = 128
var inputs = {"right": Vector2.RIGHT,
			"left": Vector2.LEFT,
			"up": Vector2.UP,
			"down": Vector2.DOWN}
var count = 0

export (PoolVector2Array) var patrol_points
export (bool) var loop = true

func _ready():
	print(patrol_points)
	
func _on_Player_moved(direc):
	if count > len(patrol_points):
		count = 0
	position += Vector2(patrol_points[count])
	count += 1


