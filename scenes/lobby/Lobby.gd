extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var playerToSet = 0
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.
	
func _input(event):
	if event is InputEventJoypadButton and event.button_index == JOY_BUTTON_0 and event.pressed and playerToSet < 4:
		print(event.device)
		if !Global.checkIfPLayerExist(event):
			match playerToSet:
				0:
					$GridContainer/left/top/VBoxContainer/TextureRect.visible = true
					$GridContainer/left/top/VBoxContainer/Label.visible = false
				1:
					$GridContainer/right/top/VBoxContainer/TextureRect.visible = true
					$GridContainer/right/top/VBoxContainer/Label.visible = false
				2:
					$GridContainer/left/bottom/VBoxContainer/TextureRect.visible = true
					$GridContainer/left/bottom/VBoxContainer/Label.visible = false
				3:
					$GridContainer/right/bottom/VBoxContainer/TextureRect.visible = true
					$GridContainer/right/bottom/VBoxContainer/Label.visible = false
			playerToSet += 1
			$AudioStreamPlayer
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
