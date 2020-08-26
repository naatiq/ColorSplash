tool
extends Node2D

export var editor_process: = true setget set_editor_process

#Export variables to set the parameters of line and triangle

export var line_color: = Color(0.228943, 0.710254, 0.945312)
export var line_width: = 3
export var triangle_color: = Color(0.722656, 0.908997, 1)


var _active_point_index: = 0
# tile map variable stores the parent tile map of colorpath
var tilemap
#tiles is an Array of points, that stores the coordinates of tiles
#On which the colorpath points are located
var tiles
#vals is an array to store the index value of each tile
var vals


func _ready() -> void:
	
	tilemap = get_parent().get_parent()    #Gets the parent tile map
	tiles = get_tiles( tilemap )           
	vals = get_vals(tilemap, tiles)        
	
	if not Engine.editor_hint:
		set_process(false)


func _process(delta: float) -> void:
	update()

func set_editor_process(value:bool) -> void:
	editor_process = value
	if not Engine.editor_hint:
		return
	set_process(value)
	
func _on_Switch_switch_activated(status):
	if(status):
		print("activated")
		for tile in tiles:
			tilemap.set_cellv(tile, 4)
	else:
		print("deactivated")
		var count = 0
		for tile in tiles:
			tilemap.set_cellv(tile, vals[count])
			count += 1
		
func _draw() -> void:
	if not Engine.editor_hint:
		return
	if not get_child_count() > 1:
		return
	var points: = PoolVector2Array()
	var triangles: = []
	var last_point: = Vector2.ZERO
	for child in get_children():
		points.append(child.position)
		if points.size() > 1:
			var center: Vector2 = (child.position + last_point) / 2
			var angle: = last_point.angle_to_point(child.position)
			triangles.append({center=center, angle=angle})
		last_point = child.position
	
	draw_polyline(points, line_color, line_width, true)
	for triangle in triangles:
		draw_triangle(triangle['center'], triangle['angle'], line_width * 2.0)

#This function returns array of tiles on which path lines are	
func get_tiles( tilemap ):
	tiles = PoolVector2Array()
	for child in get_children():
		tiles.append(tilemap.world_to_map(child.get_global_position()))
	return tiles
	
#This function returns list of index value for array of tiles
func get_vals(tilemap, tiles):
	vals = Array()
	for tile in tiles:
		vals.append(tilemap.get_cellv(tile))
	return vals	

	
func draw_triangle(center:Vector2, angle:float, radius:float) -> void:
	var points: = PoolVector2Array()
	var colors: = PoolColorArray([triangle_color])
	for i in range(3):
		var angle_point: = angle + i * 2.0 * PI / 3.0 + PI
		var offset: = Vector2(radius * cos(angle_point), radius * sin(angle_point))
		var point: = center + offset
		points.append(point)
	draw_polygon(points, colors)
