extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var dragging = false
var click_radius = 32 # Size of the sprite.
var color = Color.red

var tabShape = [PoolVector2Array()]
export var indexShape = 0

func _draw():
	for item in range(tabShape.size()):
		print("Je rentre pour dessiner")
		print(str(item))
		for index_point in range(tabShape[item].size()):
			print(str(item))
			#draw_line(tabPoint[index_point], tabPoint[index_point + 1], color)
			print("Je vais dessiner " + str(index_point))
			draw_colored_polygon(tabShape[index_point], Color.green)
	pass

func _input(event):
	if event is InputEventMouseButton and event.button_index == BUTTON_LEFT:
		if (event.position - $Seed.position).length() < click_radius:
			# Start dragging if the click is on the sprite.
			if not dragging and event.pressed:
				tabShape.push_back(PoolVector2Array())
				dragging = true
		# Stop dragging if the button is released.
		if dragging and not event.pressed:
			dragging = false
			_draw()
			indexShape += 1
			
			#update()

	if event is InputEventMouseMotion and dragging:
		# While dragging, move the sprite with the mouse.
		$Seed.position = event.position
		tabShape[indexShape].push_back(event.position)
		print(tabShape[indexShape].size())

 #Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	#update()
	pass
