extends CharacterBody2D


const SPEED = 200.0
var cardinal_direction: Vector2 = Vector2.DOWN
var direction: Vector2 = Vector2.ZERO
var state: String = "Idle"
@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var sprite: Sprite2D = $Sprite2D


func _physics_process(delta: float) -> void:
	
	direction.x = Input.get_action_strength("Right") - Input.get_action_strength("Left")
	direction.y = Input.get_action_strength("Down") - Input.get_action_strength("Up")
	
	velocity = direction * SPEED
	move_and_slide()
	
	UpdateAnimation()
	
	

func SetDirection() -> bool:
	return true 
	

func SetState() -> bool:
	var newState: String
	if direction == Vector2.ZERO:
		newState = "Idle"
	else:
		newState = "Walk"
		
	if newState == state:
		return false
	
	state = newState
	return true
	

func UpdateAnimation() -> void:
	animation_player.play( state + "_" + DicrTranslate() )
	pass
	

func DicrTranslate() -> String:
	if cardinal_direction == Vector2.DOWN:
		return "Down"
	elif cardinal_direction == Vector2.UP:
		return "Up"
	return "Side"
