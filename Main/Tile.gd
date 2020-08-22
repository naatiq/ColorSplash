extends Area2D

var pos = Vector2(0,0)
var safe = true
var neighbours = [null, null, null, null,
					null, null, null, null]


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Tile_area_entered(area):
	if area.name == "Player":
		get_node("Black").visible = false
		get_node("White").visible = true
		
	if area.name.find("Enemy") != -1:
		get_node("Black").visible = true
		get_node("White").visible = false
		
		
