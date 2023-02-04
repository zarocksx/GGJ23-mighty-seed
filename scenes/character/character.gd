extends Node2D



export var vel = Vector2()
export var MAXSPEED = 200
export var ACCELERATION = 25
export var DECELERATION = 25
export var DEADZONE = 0.1
var currentSpeed = Vector2(0,0)

func _physics_process(_delta):
	if Input.is_action_pressed("ui_left") && Input.get_axis("ui_left","ui_right") < DEADZONE:
		vel.x =Input.get_axis("ui_left","ui_right")
	elif Input.is_action_pressed("ui_right") && Input.get_axis("ui_left","ui_right") > (DEADZONE *- 1):
		vel.x =Input.get_axis("ui_left","ui_right")
	else :
		if currentSpeed.x > 0 :
			currentSpeed.x -= DECELERATION
			if currentSpeed.x < 1:
				currentSpeed.x = 0
		elif currentSpeed.x < 0 :
			currentSpeed.x += DECELERATION
			if currentSpeed.x > 1:
				currentSpeed.x = 0
			
	if Input.is_action_pressed("ui_up") && Input.get_axis("ui_up","ui_down") < DEADZONE:
		vel.y = Input.get_axis("ui_up","ui_down")
	elif Input.is_action_pressed("ui_down") && Input.get_axis("ui_up","ui_down") > (DEADZONE*- 1):
		vel.y = Input.get_axis("ui_up", "ui_down")
	else:
		if currentSpeed.y > 0 :
			currentSpeed.y -= DECELERATION
			if currentSpeed.y < 1:
				currentSpeed.y = 0
		elif currentSpeed.y < 0 :
			currentSpeed.y += DECELERATION
			if currentSpeed.y > 1:
				currentSpeed.y = 0
	
	if Input.is_action_pressed("ui_right") || Input.is_action_pressed("ui_left") || Input.is_action_pressed("ui_up") || Input.is_action_pressed("ui_down"):
		currentSpeed.x += vel.x*ACCELERATION
		currentSpeed.y += vel.y*ACCELERATION
		if currentSpeed.x > MAXSPEED :
			currentSpeed.x = MAXSPEED
		elif currentSpeed.x < -MAXSPEED:
			currentSpeed.x = -MAXSPEED
		if currentSpeed.y > MAXSPEED :
			currentSpeed.y = MAXSPEED
		elif currentSpeed.y < -MAXSPEED:
			currentSpeed.y = -MAXSPEED
	print(currentSpeed)
	
	translate(currentSpeed)


