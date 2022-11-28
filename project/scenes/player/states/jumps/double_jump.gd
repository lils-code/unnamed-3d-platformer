class_name Double_Jump
extends 'jump.gd'

func enter() -> State:
	jump_time = 0
	disp = 0
	
	player.velocity.y = 0
	
	return null

func exit() -> State:
	player.can_double_jump = false
	
	return null
