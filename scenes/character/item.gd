extends Area2D

export var point=0
var rng =RandomNumberGenerator.new()


# Called when the node enters the scene tree for the first tim


func _on_Area2D_body_entered(body):
	point+=1
	Vector2(position.x,position.y)
	print(point)
	rng.randomize()
	position.x =rng.randf_range(30,500)
	position.y=rng.randf_range(30,300)
	print(position.x)
	print(position.y)
	
	
