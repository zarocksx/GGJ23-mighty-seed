extends Area2D


func _ready():
	pass

func _on_collision_player(body: Node):
	if body.is_in_group("players"):
		body.validateRoots()

func _on_exit_player(body: Node):
	if body.is_in_group("players"):
		body.startPlanting()
