extends Node2D


export var vel = Vector2()
export var MAXSPEED = 200
export var ACCELERATION = 25
export var DECELERATION = 25
var currentSpeed = Vector2(0,0)

func _physics_process(delta):
	vel.x
	vel.y
	if Input.is_action_pressed("ui_left") :
		vel.x =Input.get_axis("ui_left","ui_right")
	elif Input.is_action_pressed("ui_right") :
		vel.x =Input.get_axis("ui_left","ui_right")
	else :
		if currentSpeed.x > 0 :
			currentSpeed.x -= DECELERATION
			if currentSpeed.x < 0:
				currentSpeed.x = 0
		elif currentSpeed.x < 0 :
			currentSpeed.x += DECELERATION
			if currentSpeed.x > 0:
				currentSpeed.x = 0
			
	if Input.is_action_pressed("ui_up") :
		vel.y =Input.get_axis("ui_down","ui_up")
	elif Input.is_action_pressed("ui_down") :
		vel.y =Input.get_axis("ui_down", "ui_up")
	else:
		if currentSpeed.y > 0 :
			currentSpeed.y -= DECELERATION
			if currentSpeed.y < 0:
				currentSpeed.y = 0
		elif currentSpeed.y < 0 :
			currentSpeed.y += DECELERATION
			if currentSpeed.y > 0:
				currentSpeed.y = 0
	
	
	currentSpeed.x += vel.x*ACCELERATION
	currentSpeed.y += vel.y*ACCELERATION
	if currentSpeed.x > MAXSPEED :
		currentSpeed.x = MAXSPEED
	if currentSpeed.x < -MAXSPEED:
		currentSpeed.x = -MAXSPEED
	if currentSpeed.y > MAXSPEED :
		currentSpeed.y = MAXSPEED
	if currentSpeed.y <-MAXSPEED:
		currentSpeed.y = -MAXSPEED
	print(currentSpeed)
	

