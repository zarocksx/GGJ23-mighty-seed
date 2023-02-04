extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var dragging = false
var click_radius = 32 # Size of the sprite.
var color = Color.red

export var tabPoint = PoolVector2Array()

func _draw():
	for index_point in range(tabPoint.size() - 1):
		draw_line(tabPoint[index_point], tabPoint[index_point + 1], color)
	pass

func _input(event):
	if event is InputEventMouseButton and event.button_index == BUTTON_LEFT:
		if (event.position - $Seed.position).length() < click_radius:
			# Start dragging if the click is on the sprite.
			if not dragging and event.pressed:
				dragging = true
		# Stop dragging if the button is released.
		if dragging and not event.pressed:
			dragging = false
			_draw()

	if event is InputEventMouseMotion and dragging:
		# While dragging, move the sprite with the mouse.
		$Seed.position = event.position
		tabPoint.push_back(event.position)

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
