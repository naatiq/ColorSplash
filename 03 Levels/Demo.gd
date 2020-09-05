extends Node2D

var Lava = preload("res://02 Items/Environment/Lava.tscn")
var Ice = preload("res://02 Items/Environment/Ice.tscn")
var Slime = preload("res://02 Items/Environment/Slime.tscn")

func _ready():
	var lava_instance = Lava.instance()
	print(lava_instance.position)
#	lava_instance.set_global_position(Vector2(523,539))


func _on_Back_button_down():
	get_tree().change_scene("res://06 UI/Start.tscn")

func _on_Restart_button_down():
	get_tree().change_scene("res://03 Levels/Demo.tscn")


func _on_YellowEnemy_start_lava(position):
	var lava_instance = Lava.instance()
	lava_instance.set_global_position(position)
	lava_instance.set_scale(Vector2(0.5,0.5))
	add_child(lava_instance)


func _on_BlueEnemy_start_ice(position):
	var ice_instance = Ice.instance()
	ice_instance.set_global_position(position)
	ice_instance.set_scale(Vector2(0.5,0.5))
	add_child(ice_instance)


func _on_GreenEnemy_start_slime(position):
	var slime_instance = Slime.instance()
	slime_instance.set_global_position(position)
	slime_instance.set_scale(Vector2(0.5,0.5))
	add_child(slime_instance)


func _on_YellowEnemy_attack_lava(positions):
	for position in positions:
		if in_grid(position):
			var lava_instance = Lava.instance()
			lava_instance.set_global_position(position)
			lava_instance.set_scale(Vector2(0.5,0.5))
			add_child(lava_instance)

func in_grid(position):
	if $TileMap.get_cellv($TileMap.world_to_map(position)) == -1:
		return false
	else:
		return true


func _on_BlueEnemy_attack_ice(positions):
	for position in positions:
		if in_grid(position):
			var ice_instance = Ice.instance()
			ice_instance.set_global_position(position)
			ice_instance.set_scale(Vector2(0.5,0.5))
			add_child(ice_instance)


func _on_GreenEnemy_attack_slime(positions):
	for position in positions:
		if in_grid(position):
			var slime_instance = Slime.instance()
			slime_instance.set_global_position(position)
			slime_instance.set_scale(Vector2(0.5,0.5))
			add_child(slime_instance)
