extends Node2D

var shape: Array = []
var shapes: Array = []
var indexShape: int = 0
export var isPlanting: bool = false
var lastSeed: Vector2 = Vector2(0,0)
export var distanceBetweenSeeds: float = 1

onready var player: Node = get_parent()

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
	$"../Trail".clearTrail()

	if shape.size() > 0:
		GameLogic.addRoots(shape)
		shapes.push_front(shape)
		shape = []

func _process(_delta):
	plantSeed()



