extends AnimationPlayer

export var lobbyPath: NodePath
export var waitingPath: NodePath
export var gamePath: NodePath

onready var lobby = get_node(lobbyPath)
onready var waiting = get_node(waitingPath)
onready var game = get_node(gamePath)

var scenes = ["waiting","lobby","game"]
var current_scene = 0


func nextScene():
	match scenes[current_scene]:
		"waiting":
			waiting.visible = false
			lobby.visible = true
		"lobby":
			lobby.visible = false
			game.visible = true
		_:
			pass
	current_scene +=1

func backScene():
	match scenes[current_scene]:
		"lobby":
			waiting.visible = true
			lobby.visible = false
		"game":
			lobby.visible = true
			game.visible = false
		_:
			pass
	current_scene -=1

func _process(_delta):
	if Input.is_action_pressed("ui_accept"):
		if  current_scene == 0:
			play("transition")
	if Input.is_action_pressed("ui_cancel"):
		if current_scene == 1:
			play("back_transition")
	if Input.is_action_pressed("ui_start"):
		if Global.getPlayersBinded().size() > 1:
			play("transition")
