class_name State
extends Node

@onready var player : Player = find_parent('player')
var states : Dictionary

func init():
	states = player.states

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
