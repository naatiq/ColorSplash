extends TileMap

#Keep adding enums as new characters are added
enum TILE_CONTAINS { EMPTY = -1, PLAYER, ENEMY1, TEST,  BLANK = 32}

func _ready():
	for child in get_children():
		#set_cellv(world_to_map(child.position), child.type)
		print(world_to_map(child.position))
		print(cell_size)

	
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
