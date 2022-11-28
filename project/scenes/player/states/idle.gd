class_name Idle
extends 'state.gd'

func input(event : InputEvent) -> State:
	
	if (Input.is_action_pressed('left') or 
		Input.is_action_pressed('right') or 
		Input.is_action_pressed('up') or 
		Input.is_action_pressed('down')
	):
		return states.move
	
	if Input.is_action_just_pressed('jump'):
		return states.jump
	
	return null

func physics_process(delta : float) -> State:
	if !player.is_on_floor():
		return states.in_air
	
	return null
