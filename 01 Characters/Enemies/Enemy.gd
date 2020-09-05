extends Area2D

var points: = PoolVector2Array()
onready var Grid = get_parent()
var current_index = 0
var next_index = 1
export (float, 10) var move_time
export var wait_time = 0.1
var waiting = false


func _ready():
	var pos
	var offset
	for child in $ColorPath.get_children():
		pos = Grid.map_to_world(Grid.world_to_map(child.get_global_position()))
		offset = Vector2(Grid.get_cell_size().x/2, Grid.get_cell_size().y/2)
		points.append(pos+offset)


func _process(delta):
	if current_index == points.size() -1 :
		next_index = 0
	else:
		next_index = current_index + 1
	move(points[next_index])
	current_index = next_index
	
func move(next):
	set_process(false)
	$AnimationPlayer.play("walk")
	
	# Move the node to the target cell instantly,
	# and animate the sprite moving from the start to the target cell
	var move_direction = (next - position).normalized()
	
	$Tween.interpolate_property(
		self,"position",
		position,next,
		$AnimationPlayer.current_animation_length-wait_time,
		Tween.TRANS_LINEAR, Tween.EASE_IN)
		
	attack()
	$Tween.start()
#	update_trails(current_index)
	# Stop the function execution until the animation finished
	yield($AnimationPlayer, "animation_finished")
	set_process(true)

	
func update_trails(current_index):
	pass

func attack():
	pass
