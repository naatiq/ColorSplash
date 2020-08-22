extends Position2D
#This script is used to generate Map of a level and 
#Keep track of various nodes in the map.

#Export Variables
export var map_size = [5,6]
export var tile_size = 128
export var start_pos = Vector2(200,200)

#On Ready Variables
onready var tile = preload("res://Tile.tscn")
onready var player = preload("res://Player.tscn")

#Variables
var map_array = []

func _ready():
	#Function to Initialize map_array and tile_positions
	populate_map_array()
	initialize_player()

			
func populate_map_array():
	for i in range(0,map_size[0]):
		map_array.append([])
		for j in range(0, map_size[1]):
			map_array[i].append(tile.instance())
			map_array[i][j].set_name('tile'+'('+ String(i) + ',' + String(j) + ')')
			self.add_child(map_array[i][j])
			map_array[i][j].position = Vector2(tile_size/2 + i*tile_size, tile_size/2 + j*tile_size)

func initialize_player():
	var pl = player.instance()
	self.add_child(pl)
	pl.set_name('Player')
	pl.position = Vector2(tile_size/2, tile_size/2)
