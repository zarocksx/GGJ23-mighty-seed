extends KinematicBody2D



export var vel = Vector2()
export var MAXSPEED: float = 200
export var ACCELERATION: float = 25
export var DECELERATION: float = 25
export var gamepad = 0
var currentSpeed = Vector2(0,0)
onready var rootPlant = get_node("RootPlanting")


func _ready():
	print("player : ", str(gamepad), " is ready")

func validateRoots():
	rootPlant.plantRoots()

func startPlanting():
	rootPlant.startPlanting()


func _physics_process(_delta):
	if Input.is_action_pressed("gp_left_" + str(gamepad)) || Input.is_action_pressed("gp_right_" + str(gamepad)):
		vel.x = Input.get_joy_axis(gamepad, JOY_AXIS_0)
		currentSpeed.x += vel.x * ACCELERATION

		if currentSpeed.x > MAXSPEED :
			currentSpeed.x = MAXSPEED
		elif currentSpeed.x < MAXSPEED * -1:
			currentSpeed.x = MAXSPEED * -1
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
		currentSpeed.y += vel.y * ACCELERATION

		if currentSpeed.y > MAXSPEED :
			currentSpeed.y = MAXSPEED
		elif currentSpeed.y < MAXSPEED * -1:
			currentSpeed.y = MAXSPEED * -1
	else:
		if currentSpeed.y > 0 :
			currentSpeed.y -= DECELERATION
			if currentSpeed.y < 1:
				currentSpeed.y = 0
		elif currentSpeed.y < 0 :
			currentSpeed.y += DECELERATION
			if currentSpeed.y > 1:
				currentSpeed.y = 0

	move_and_collide(currentSpeed)
	print(currentSpeed)


