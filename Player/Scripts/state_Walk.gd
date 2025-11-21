class_name State_Walk
extends State


@export var WALKING_SPEED: int = 100
@onready var Idle: State_Walk = $"../Idle"


# What happens when player enter this state
func Enter() -> void:
	player.UpdateAnimation("Walk")
	pass
 

# What happens when player exit this state
func Exit() -> void:
	pass


# Ưhat happes during the _process update in this State
func Process( _delta: float ) -> State:
	if player.direction == Vector2.ZERO:
		return Idle
	
	player.velocity = player.direction * WALKING_SPEED
	return null




# What happens during the _physic_process in this State
func Physics( _delta: float ) -> State:
	return null


# What happens with Input in this State
func HandleInput( _event: InputEvent ) -> State:
	return null
