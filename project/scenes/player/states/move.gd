class_name Move
extends 'state.gd'

@export var top_speed : float = 100

@export var max_accel_time : float = 0.1
@export var vel_curve : Curve = preload("res://scenes/player/states/speed_curve.tres")

var vel : float = 0

func enter(prev : State) -> State:
	
	if prev != Move:
		player.h_accel_time = 0
	
	return null

func input(event : InputEvent) -> State:
	if Input.is_action_just_pressed("jump"):
		return states.jump
	
	return null


func physics_process(delta : float) -> State:
	
	var prev_vel_horizontal = Vector3(player.velocity.x, 0, player.velocity.z)
	var v = vel_curve.sample(player.h_accel_time / max_accel_time) * top_speed * delta;
	var vel = Vector3(v * get_input_dir().x, 0, v * get_input_dir().y)
	
	player.velocity += vel
	
	if player.velocity == Vector3.ZERO:
		return states.idle
	
	if !player.is_on_floor():
		return states.in_air
	
	player.h_accel_time += delta
	
	return null

func get_input_dir() -> Vector2:
	var u = int(Input.is_action_pressed('right')) + (-1 * int(Input.is_action_pressed('left')))
	var v = int(Input.is_action_pressed('up')) + (-1 * int(Input.is_action_pressed('down')))
	
	return Vector2(u, v)
