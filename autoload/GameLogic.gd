extends Node

onready var terrain = get_node("/root/Menu/Terrain")


func addRoots(shape):
	var poly = Polygon2D.new()
	poly.set_polygon(shape)
	terrain.add_child(poly)

	var polyConv = ConvexPolygonShape2D.new()
	polyConv.points = shape
	var dynaColl = CollisionShape2D.new()
	dynaColl.shape = polyConv
	terrain.add_child(dynaColl)
