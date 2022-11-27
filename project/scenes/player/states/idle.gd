class_name Idle
extends Move

func input(event : InputEvent) -> State:
	
	if Input.is_action_just_pressed("jump"):
		return player.jumping
	
	return null

func physics_process(delta : float) -> State:
	
	if !player.is_on_floor():
		return player.falling
	
	return null
