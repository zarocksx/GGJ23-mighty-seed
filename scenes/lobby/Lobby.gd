extends Control

func _input(event):
	if event is InputEventJoypadButton and event.button_index == JOY_BUTTON_0 and event.pressed and (Global.getPlayersBinded().size() - 1) < 4:
		print(event.device)
		if !Global.checkIfPLayerExist(event):
			match Global.getPlayersBinded().size() - 1:
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
	if (Global.getPlayersBinded().size() > 1):
		$startToContinue.visible = true
