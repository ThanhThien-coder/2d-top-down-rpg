class_name State_Idle
extends State


@onready var Walk: State = $"../Walk"
@onready var Attack: State = $"../Attack"


# What happens when player enter this state
func Enter() -> void:
	player.UpdateAnimation("Idle")
	pass


# What happens when player exit this state
func Exit() -> void:
	pass


# Ưhat happes during the _process update in this State
func Process( _delta: float ) -> State:
	if player.direction != Vector2.ZERO:
		return Walk
	
	player.velocity = Vector2.ZERO
	return null


# What happens during the _physic_process in this State
func Physics( _delta: float ) -> State:
	return null


# What happens with Input in this State
func HandleInput( _event: InputEvent ) -> State:
	if _event.is_action_pressed("Attack"):
		return Attack
	return null
