class_name Move
extends 'state.gd'

@export var speed : float = 1000

var input_dir : Vector2 = Vector2.ZERO

func input(event : InputEvent) -> State:
	if Input.is_action_just_pressed("jump"):
		return states.jump
	
	return null

func process(delta : float) -> State:
	input_dir = get_input_dir()
	
	return null

func physics_process(delta : float) -> State:
	var vel = Vector2(input_dir.x, input_dir.y) * speed * delta
	
	player.velocity.x = vel.x
	player.velocity.z = vel.y
	
	if player.velocity == Vector3.ZERO:
		return states.idle
	
	if !player.is_on_floor():
		return states.in_air
	
	return null

func get_input_dir() -> Vector2:
	var h = int(Input.is_action_pressed('right')) + (-1 * int(Input.is_action_pressed('left')))
	var v = int(Input.is_action_pressed('up')) + (-1 * int(Input.is_action_pressed('down')))
	
	return Vector2(h, v)
