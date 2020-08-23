extends "res://Characters/character.gd"

#Constants
var TILE_SIZE = 128

#On Ready Var
#Get the parent Grid
onready var Grid = get_parent()

func _ready():
	pass
	
func _process(delta):
	var input_direction = get_input_direction()
	if not input_direction:
		return
	update_look_direction(input_direction)
	
	var target_position = Grid.request_move(self, input_direction)
	
	if target_position:
		move_to(target_position)
	else:
		bump()


#used to get the direction of input based on player key press
func get_input_direction():
	if(Input.is_action_pressed('right')):
		return Vector2.RIGHT
		
	if(Input.is_action_pressed('left')):
		return Vector2.LEFT
	
	if(Input.is_action_pressed('up')):
		return Vector2.UP
	
	if(Input.is_action_pressed('down')):
		return Vector2.DOWN
	
#used to update the direction of player based on movement direction
func update_look_direction(direction):
	$Sprite.rotation =  direction.angle() + deg2rad(90)
	
func move_to(target_position):
	set_process(false)
	print("walked")
	$AnimationPlayer.play("walk")
	
	# Move the node to the target cell instantly,
	# and animate the sprite moving from the start to the target cell
	var move_direction = (target_position - position).normalized()
	
	$Tween.interpolate_property(
		self,"position",
		position,target_position,
		$AnimationPlayer.current_animation_length,
		Tween.TRANS_LINEAR, Tween.EASE_IN)

	$Tween.start()
	
	# Stop the function execution until the animation finished
	yield($AnimationPlayer, "animation_finished")
	
	set_process(true)
	

func bump():
	set_process(false)
	$AnimationPlayer.play("bump")
	yield($AnimationPlayer, "animation_finished")
	set_process(true)
	

