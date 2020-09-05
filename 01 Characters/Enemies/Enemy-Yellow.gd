extends "res://01 Characters/Enemies/Enemy.gd"

signal start_lava(position)
signal attack_lava(positions)

export var attack_length = 3
export var area_length = 2
export var attack_probability = 0.3

enum ATTACK_TYPE {LINEAR,  AREA, DIAGONAL}
export(ATTACK_TYPE) var attack_type = ATTACK_TYPE.LINEAR

var attack_direction = Vector2.ZERO
var attack_positions = PoolVector2Array()
var directions = {'right': Vector2(1,0),
					'left': Vector2(-1,0),
					'up': Vector2(0,-1),
					'down': Vector2(0,1)}
					
var diag_diections = {'topright': Vector2(1,-1),
					'topleft': Vector2(-1,-1),
					'bottomright': Vector2(1,1),
					'bottomleft': Vector2(-1,1)}

func _ready():
	randomize()
	
func update_trails(current_index):
	 emit_signal("start_lava", points[current_index])

func attack():
	
	if randi() % 10 > 10*attack_probability:
		match attack_type:
			ATTACK_TYPE.LINEAR:
				calculate_linear_positions()
			ATTACK_TYPE.AREA:
				calculate_area_positions()
			ATTACK_TYPE.DIAGONAL:
				calculate_diagonal_positions()
				
		emit_signal("attack_lava", attack_positions)

func calculate_linear_positions():
	attack_positions.resize(0)
	attack_positions.append(get_global_position())
	var direction = directions[directions.keys()[randi() % 4]]
	for i in range(0, attack_length):
		attack_positions.append(get_global_position() + (i+1) * Grid.cell_size.x * direction)
		
func calculate_area_positions():
	attack_positions.resize(0)
	attack_positions.append(get_global_position())
	for i in range(-1,2):
		for j in range(-1,2):
			print(str(i) + "'" + str(j))
			if not (i ==  0 and j == 0):
				var append_vector = Vector2(i,j)
				attack_positions.append(get_global_position() + Grid.cell_size.x * append_vector)

func calculate_diagonal_positions():
	attack_positions.resize(0)
	attack_positions.append(get_global_position())
	var direction = diag_diections[diag_diections.keys()[randi() % 4]]
	for i in range(0, attack_length):
		attack_positions.append(get_global_position() + (i+1) * Grid.cell_size.x * direction)
		
