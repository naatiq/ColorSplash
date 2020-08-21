extends Area2D

signal moved( direc )

var tile_size = 128
var inputs = {"right": Vector2.RIGHT,
			"left": Vector2.LEFT,
			"up": Vector2.UP,
			"down": Vector2.DOWN}
onready var ray = $RayCast2D
onready var tween = $Tween
export var speed = 3

func _ready():
	pass

func _unhandled_input(event):
	if tween.is_active():
		return
	for dir in inputs.keys():
		if Input.is_action_pressed(dir):
			move(dir)

func move(dir):
	ray.cast_to = inputs[dir] * tile_size
	ray.force_raycast_update()
	if !ray.is_colliding():
#		position += inputs[dir] * tile_size
		emit_signal("moved" , inputs[dir])
		move_tween(dir)

func move_tween(dir):
	tween.interpolate_property(self, "position",
		position, position + inputs[dir] * tile_size,
		0.5/speed, Tween.TRANS_SINE, Tween.EASE_IN_OUT)
	tween.start()


func _on_Player_area_entered(area):
	if area.name.find("Enemy") != -1:
		area.queue_free()
		
