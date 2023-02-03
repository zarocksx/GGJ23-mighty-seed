extends Node2D


var vel = Vector2()
var speed =200


func _physics_process(delta):
	vel.x=0
	var direction = 1
	if Input.is_action_pressed("ui_left") :
		vel.x -= speed
		direction= -1
	if Input.is_action_pressed("ui_right") :
		vel.x += speed
		direction = 1
	if Input.is_action_just_pressed("ui_up") :
		vel.y =-speed
		direction =-1
	if Input.is_action_just_pressed("ui_down") :
		vel.y =+speed
		direction =1
		
