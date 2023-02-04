extends KinematicBody2D



export var vel = Vector2()
export var MAXSPEED = 200
export var ACCELERATION = 25
export var DECELERATION = 25
export var gamepad = 0
var currentSpeed = Vector2(0,0)

func _ready():
	print(Input.get_connected_joypads(), "gp_up_" + str(gamepad))


func _physics_process(_delta):
	if Input.is_action_pressed("gp_left_" + str(gamepad)) || Input.is_action_pressed("gp_right_" + str(gamepad)):
		vel.x = Input.get_joy_axis(gamepad, JOY_AXIS_0)
	else :
		if currentSpeed.x > 0 :
			currentSpeed.x -= DECELERATION
			if currentSpeed.x < 1:
				currentSpeed.x = 0
		elif currentSpeed.x < 0 :
			currentSpeed.x += DECELERATION
			if currentSpeed.x > 1:
				currentSpeed.x = 0

	if Input.is_action_pressed("gp_up_" + str(gamepad)) || Input.is_action_pressed("gp_down_" + str(gamepad)):
		vel.y = Input.get_joy_axis(gamepad, JOY_AXIS_1)
	else:
		if currentSpeed.y > 0 :
			currentSpeed.y -= DECELERATION
			if currentSpeed.y < 1:
				currentSpeed.y = 0
		elif currentSpeed.y < 0 :
			currentSpeed.y += DECELERATION
			if currentSpeed.y > 1:
				currentSpeed.y = 0

	if Input.is_action_pressed("gp_left_" + str(gamepad)) || Input.is_action_pressed("gp_right_" + str(gamepad)) || Input.is_action_pressed("gp_up_" + str(gamepad)) || Input.is_action_pressed("gp_down_" + str(gamepad)):
		currentSpeed += vel*ACCELERATION
		if currentSpeed.x > MAXSPEED :
			currentSpeed.x = MAXSPEED
		elif currentSpeed.x < MAXSPEED * -1:
			currentSpeed.x = MAXSPEED * -1
		if currentSpeed.y > MAXSPEED :
			currentSpeed.y = MAXSPEED
		elif currentSpeed.y < MAXSPEED * -1:
			currentSpeed.y = MAXSPEED * -1

	move_and_collide(currentSpeed)


