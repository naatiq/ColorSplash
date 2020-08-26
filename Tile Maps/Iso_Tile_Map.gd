extends TileMap

#Keep adding enums as new characters are added
enum TILE_CONTAINS { EMPTY = -1, PLAYER, ENEMY1, TEST,  BLANK = 32}

func _ready():
	for child in get_children():
		#Center each child to the centre of the tile.
		child.position = map_to_world(world_to_map(child.position))

	
func get_cell_pawn(coordinates):
	for node in get_children():
		if world_to_map(node.position) == coordinates:
			return(node)
			
func request_move(pawn, direction):
	var cell_start = world_to_map(pawn.position)
	var cell_target = cell_start + direction
	return update_pawn_position(pawn, cell_start, cell_target)
#		
			
func update_pawn_position(pawn, cell_start, cell_target):
	return map_to_world(cell_target)
