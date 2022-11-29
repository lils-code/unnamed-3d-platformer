class_name Player
extends CharacterBody3D

@export var start_state : NodePath
@onready var state : State = get_node(start_state)

var states : Dictionary
var h_accel_time : float = 0

func _ready():
	for i in $states.get_children():
		states[i.name] = i
	
	for i in states:
		states[i].init()

func _unhandled_input(event: InputEvent) -> void:
	if state.states:
		var new = state.input(event)
		
		if new:
			change(new)
			
			state.input(event)

func _process(delta: float) -> void:
	if state.states:
		var new = state.process(delta)
		
		if new:
			change(new)
			
			state.process(delta)

func _physics_process(delta: float) -> void:
	if state.states:
		var new = state.physics_process(delta)
		
		if new:
			change(new)
			
			state.physics_process(delta)
	
	move_and_slide()

func change(new : State) -> void:
	state.exit(new)
	new.enter(state)
	
	state = new
