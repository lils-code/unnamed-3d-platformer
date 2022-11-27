class_name State
extends Node

var player : Player

func init(p : Player) -> void:
	player = p
	
	for i in get_children():
		i.init(p)

func enter() -> State:
	return null

func exit() -> State:
	return null

func input(event : InputEvent) -> State:
	return null

func process(delta : float) -> State:
	return null

func physics_process(delta : float) -> State:
	return null
