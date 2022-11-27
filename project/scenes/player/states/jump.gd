class_name Jump
extends In_Air

@export var accel_curve : Curve
@export var max_hold_time : float

var cur_hold_time : float = 0

func enter():
	cur_hold_time = 0

func input(event : InputEvent) -> State:
	
	if Input.is_action_just_released("jump"):
		return player.falling
	
	return null

func physics_process(delta : float) -> State:
	super(delta)
	
#	cur_hold_time += delta
#	var t = cur_hold_time / max_hold_time
#
#	if t <= 0:
#		return null
	
	player.velocity.y = 50 * delta
	
	return null
