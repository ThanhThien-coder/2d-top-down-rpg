class_name StateMachine
extends Node

var states: Array[State]
var prevState: State
var currentState: State


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	process_mode = Node.PROCESS_MODE_DISABLED
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	ChangeState(currentState.Process(delta))
	pass



func _physics_process(delta: float) -> void:
	ChangeState(currentState.Physics(delta))
	pass



func _unhandled_input(event: InputEvent) -> void:
	ChangeState(currentState.HandleInput(event))
	pass



func Initialize( _player: Player ) -> void:
	states = []
	
	for c in get_children():
		if c is State:
			states.append(c)
	
	if states .size() > 0:
		states[0].player = _player
		ChangeState(states[0])
		process_mode = Node.PROCESS_MODE_INHERIT




func ChangeState( newState: State ) -> void:
	if newState == null || newState == currentState:
		return
	
	if currentState:
		currentState.Exit()
	
	prevState = currentState
	currentState = newState
	currentState.Enter()
