class_name In_Air
extends 'move.gd'

@export var gravity : float = -29.8704

func input(event : InputEvent) -> State:
	
#	if !(player.state == states.jump) && player.can_double_jump:
#		if Input.is_action_just_pressed("jump"):
#			return states.double_jump
	
	return null

func physics_process(delta : float) -> State:
	super(delta)
	
	if player.is_on_floor():
		if get_input_dir() != Vector2.ZERO:
			return states.move
		
		return states.idle
	else:
		player.velocity.y += gravity * delta
	
	return null
