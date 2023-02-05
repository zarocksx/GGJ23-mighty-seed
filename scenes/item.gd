extends Sprite

export var point =0

func _on_Area2D_body_entered(body):
	point +=1
	queue_free()
