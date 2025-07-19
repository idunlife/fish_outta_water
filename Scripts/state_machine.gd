extends Node

@export var initial_state : State

var current_state : State
var states: Dictionary= {}

func _ready():
	for child in get_children():
		if child is State:
			states[child.name.to_lower()] = child
			child.state_transitioned.connect(on_child_transition)
		if child is StateInputWatcher:
			child.request_state_change.connect(on_input_watcher_request_state_change)

	if initial_state:
		initial_state.Enter()
		current_state = initial_state

func _process(delta):
	if current_state:
		current_state.Update(delta)

func _physics_process(delta):
	if current_state:
		current_state.Physics_Update(delta)

func on_child_transition(state, new_state_name):
	if state!=current_state:
		return
	var new_state = states.get(new_state_name.to_lower())
	if !new_state:
		return

	if current_state:
		current_state.Exit()
	new_state.Enter()

	current_state = new_state

func on_input_watcher_request_state_change(state_name: String):
	if state_name != current_state.name and states.has(state_name):
		on_child_transition(current_state, state_name)
