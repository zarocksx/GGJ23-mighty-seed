extends Line2D

var point = Vector2()
var oldPos
var drawTrail = false


func _process(_delta):
	global_position = Vector2(0,0)
	global_rotation = 0
	point = get_parent().global_position
	if point != oldPos && $"../RootPlanting".isPlanting:
		add_point(point)
		oldPos = point

func clearTrail():
	print("clear Trail")
	while get_point_count() > 0:
		remove_point(0)
	drawTrail = false
	pass

func beginTrail():
	print("Begin Trail")
	drawTrail = true
	pass
