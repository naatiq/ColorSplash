extends TileMap


func _ready():
	print(cell_size)
	for child in get_children():
		#Center each child to the centre of the tile.
		child.position = map_to_world(world_to_map(child.position))
		print(str(child.position) + "  " + child.name)
		child.position += Vector2(cell_size.x/2, cell_size.y/2)
		print(str(child.position) + "  " + child.name)
	
func get_cell_pawn(coordinates):
	for node in get_children():
		if world_to_map(node.position) == coordinates:
			return(node)
			
func request_move(pawn, direction):
	var cell_start = world_to_map(pawn.position)
	var cell_target = cell_start + direction
	print(cell_start)
	print(cell_target)
	print(get_cellv(cell_target))
	return update_pawn_position(pawn, cell_start, cell_target)
#		
			
func update_pawn_position(pawn, cell_start, cell_target):
	if get_cellv(cell_target) == -1:
		return
	return map_to_world(cell_target) + Vector2(cell_size.x/2, cell_size.y/2)
