class_name Jump
extends '../in_air.gd'

@export var jump_accel_curve : Curve
@export var jump_accel = 500

const max_jump_time : float = 0.1
var jump_time : float = 0

var disp : float = 0

func enter() -> State:
	jump_time = 0
	disp = 0
	
	return null

func input(event : InputEvent) -> State:
	
	if Input.is_action_just_released("jump"):
		return states.in_air
	
	return null

func physics_process(delta : float) -> State:
	super(delta)
	
#	cur_hold_time += delta
#	var t = cur_hold_time / max_hold_time
#
#	if t <= 0:
#		return null
	
	var t = jump_time / max_jump_time
	
	if t >= 1:
		return states.in_air
	
	player.velocity.y += jump_accel_curve.sample(t) * jump_accel * delta
	disp += player.velocity.y
	
	jump_time += delta
	
	return null
