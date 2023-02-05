extends Area2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first tim


func _on_Area2D_body_entered(body):
	
	queue_free()
	
