extends Node2D

var Lava = preload("res://02 Items/Environment/Lava.tscn")
var lava_instance

func _ready():
	lava_instance = Lava.instance()
	add_child(lava_instance)
	lava_instance.set_global_position(Vector2(523,539))
