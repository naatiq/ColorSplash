extends Area2D

#On Ready Var
#Get the parent Grid
onready var Grid = get_parent()
var in_motion = false
var input_direction = Vector2(0,0)
var current_color = 'red' setget ,current_color_get

func _ready():
	pass
	
func _process(delta):
#	if not in_motion:
#			input_direction = get_input_direction()
		
	if not input_direction:
		return
	update_look_direction(input_direction)
	
	var target_position = Grid.request_move(self, input_direction)
	
	if target_position:
		move_to(target_position)
		input_direction = Vector2.ZERO
		in_motion = true
	else:
		bump()
		in_motion = false


#used to get the direction of input based on player key press
func get_input_direction():
	if Input.is_action_pressed('right'):
		return Vector2(1.0,0)
		
	if Input.is_action_pressed('left'):
		return Vector2(-1.0,0)
	
	if Input.is_action_pressed('up'):
		return Vector2 (0,-1.0)
	
	if Input.is_action_pressed('down'):
		return Vector2(0, 1.0)
	
#used to update the direction of player based on movement direction
func update_look_direction(direction):
	## $Sprite.rotation =  direction.angle() + deg2rad(90)
	pass
	
func move_to(target_position):
	set_process(false)
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


func _on_Player_area_entered(area):
	in_motion = false
	input_direction = Vector2(0,0)
	
	
	if area.is_in_group("Stoppers"):
		in_motion = false
	
	if area.is_in_group("Vortex"):
		in_motion = false
		if current_color == 'yellow':
			yield_animation_play('YellowToRed')
		if current_color == 'green':
			yield_animation_play('GreenToRed')
		if current_color == 'blue':
			yield_animation_play('BlueToRed')
		current_color = 'red'
		
	
	if area.is_in_group("YellowEnemies"):
		in_motion = false
		area.queue_free()
		if current_color == 'red':
			yield_animation_play("RedToYellow")
		if current_color == 'blue':
			yield_animation_play("BlueToYellow")
		if current_color == 'green':
			yield_animation_play("GreenToYellow")
		current_color = 'yellow'
	
	if area.is_in_group("GreenEnemies"):
		in_motion = false
		area.queue_free()
		if current_color == 'red':
			yield_animation_play("RedToGreen")
		if current_color == 'blue':
			yield_animation_play("BlueToGreen")
		if current_color == 'yellow':
			yield_animation_play("YellowToGreen")
		current_color = 'green'
	
	if area.is_in_group("BlueEnemies"):
		in_motion = false
		area.queue_free()
		if current_color == 'red':
			yield_animation_play("RedToBlue")
		if current_color == 'green':
			yield_animation_play("GreenToBlue")
		if current_color == 'yellow':
			yield_animation_play("YellowToBlue")
		current_color = 'blue'
		
func yield_animation_play(animation):
	set_process(false)
	$AnimationPlayer.play(animation)
	yield($AnimationPlayer, "animation_finished")
	set_process(true)


func _on_SwipeDetector_swiped(direction):
	if direction.length() == 0:
		input_direction = direction
		in_motion = false
	else:
		input_direction = -direction

func current_color_get():
	return current_color
