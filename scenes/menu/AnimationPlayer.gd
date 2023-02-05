extends AnimationPlayer

export var lobbyPath: NodePath
export var waitingPath: NodePath

onready var lobby = get_node(lobbyPath)
onready var waiting = get_node(waitingPath)



func changeScene():
	waiting.visible = !waiting.visible
	lobby.visible = !lobby.visible
	pass

func _process(_delta):
	if (Input.is_action_pressed("ui_accept") && waiting.visible) || (Input.is_action_pressed("ui_cancel") && !waiting.visible):
		play("transition")

