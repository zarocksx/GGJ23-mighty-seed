extends Node2D

var dragging = false
var click_radius = 32 # Size of the sprite.
var color = Color.red

var tabShape = []
var shape = PoolVector2Array()
export var indexShape = 0

func _draw():
	if tabShape.size() > 0:
		print('draw', tabShape.size())
		for item in range(tabShape.size()):
			print("Je rentre pour dessiner la forme: ", item)

			for index_point in range(tabShape[item].size()):
				#draw_line(tabPoint[index_point], tabPoint[index_point + 1], color)
				print("Je vais dessiner le point: " + str(index_point) + " de la forme : ", str(item))
				draw_colored_polygon(tabShape[item], Color.green)

func _input(event):
	if event is InputEventMouseButton and event.button_index == BUTTON_LEFT:
		if (event.position - $Seed.position).length() < click_radius:
			# Start dragging if the click is on the sprite.
			if not dragging and event.pressed:
				dragging = true
		# Stop dragging if the button is released.
		if dragging and Input.is_action_just_released("click"):
			tabShape.append(shape)
			shape = PoolVector2Array()
			print(tabShape)
			update()
			indexShape += 1

			dragging = false


	if event is InputEventMouseMotion and dragging:

		# While dragging, move the sprite with the mouse.
		$Seed.position = event.position

		shape.push_back(event.position)
		#print(tabShape[indexShape-1].size())

 #Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	#update()
	pass
