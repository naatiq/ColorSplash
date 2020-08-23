extends TileMap

#Keep adding enums as new characters are added
enum TILE_CONTAINS { EMPTY = -1, PLAYER, ENEMY1, TEST,  BLANK}

func _ready():
	for child in get_children():
		set_cellv(world_to_map(child.position), child.type)
		print(get_cellv(Vector2(3,1)))

	
func get_cell_pawn(coordinates):
	for node in get_children():
		if world_to_map(node.position) == coordinates:
			return(node)
			
func request_move(pawn, direction):
	var cell_start = world_to_map(pawn.position)
	var cell_target = cell_start + direction
	print(cell_target)
	print(get_cellv(cell_target))
	var cell_target_type = get_cellv(cell_target)
	print(cell_target_type)
	print(TILE_CONTAINS.BLANK)
	match cell_target_type:
		TILE_CONTAINS.BLANK:
			return update_pawn_position(pawn, cell_start, cell_target)
#		TILE_CONTAINS.ENEMY1:
#			var object_pawn = get_cell_pawn(cell_target)
#			object_pawn.queue_free()
#			return update_pawn_position(pawn, cell_start, cell_target)
		TILE_CONTAINS.EMPTY:
			print("Cannot Move there")
			
func update_pawn_position(pawn, cell_start, cell_target):
	set_cellv(cell_target, pawn.type)
	set_cellv(cell_start, TILE_CONTAINS.BLANK)
	return map_to_world(cell_target) + cell_size / 2
