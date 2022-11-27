class_name In_Air
extends Move

const gravity : float = -29.8704

func physics_process(delta : float) -> State:
	if player.is_on_floor():
		return player.idling
	else:
		player.velocity.y += gravity * delta
	
	return null
