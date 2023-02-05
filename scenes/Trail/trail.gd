extends Line2D

export var trailLength = 50
var point = Vector2()
var oldPos
var newPos


func _process(_delta):
	global_position = Vector2(0,0)
	global_rotation = 0
	point = get_parent().global_position
	
	add_point(point)
#	while get_point_count() > trailLength:
#		remove_point(0)


func _on_Timer_timeout():
	
	pass # Replace with function body.
