extends Node2D

var shape: Array = []
var shapes = []
var indexShape = 0
var isPlanting = false
var lastSeed: Vector2 = Vector2(0,0)
export var distanceBetweenSeeds = 1

onready var player = get_parent()

func startPlanting():
	lastSeed = Vector2(0,0)
	isPlanting = true
	plantSeed()

func plantSeed():
	if isPlanting && lastSeed.distance_to( Vector2(player.position.x,player.position.y) ) > distanceBetweenSeeds:
		lastSeed = player.position
		shape.push_back(lastSeed)

func plantRoots():
	plantSeed()
	isPlanting = false
	print("plant root")

	if shape.size() > 0:
		GameLogic.addRoots(shape)
		shapes.push_front(shape)
		shape = []

func _process(_delta):
	plantSeed()



