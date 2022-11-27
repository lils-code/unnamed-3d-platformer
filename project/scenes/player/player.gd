class_name Player
extends CharacterBody3D

@export var start_state : NodePath
@onready var state : Node = get_node(start_state)

@export var idle_state : NodePath
@onready var idling : Node = get_node(idle_state)

@export var jump_state : NodePath
@onready var jumping : Node = get_node(jump_state)

@export var fall_state : NodePath
@onready var falling : Node = get_node(fall_state)

func _ready() -> void:
	get_node('state_manager').init(self)

func _unhandled_input(event: InputEvent) -> void:
	var new = state.input(event)
	change(new)

func _process(delta: float) -> void:
	var new = state.process(delta)
	change(new)

func _physics_process(delta: float) -> void:
	var new = state.physics_process(delta)
	move_and_slide()
	change(new)

func change(new : Node) -> void:
	if new:
		state.exit()
		state = new
		state.enter()
