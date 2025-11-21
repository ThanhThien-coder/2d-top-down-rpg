class_name Player
extends CharacterBody2D

var cardinal_direction: Vector2 = Vector2.DOWN
var direction: Vector2 = Vector2.ZERO

@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var sprite: Sprite2D = $Sprite2D
@onready var state_machine: StateMachine = $StateMachine



func _ready():
	state_machine.Initialize(self)


func _physics_process(delta: float) -> void:
	
	direction.x = Input.get_action_strength("Right") - Input.get_action_strength("Left")
	direction.y = Input.get_action_strength("Down") - Input.get_action_strength("Up")
	
	move_and_slide()



# xác đinh hướng quay mặt hiện tại của nhân vật
func SetDirection() -> bool:
	var new_dir: Vector2 = cardinal_direction
	if direction == Vector2.ZERO:
		return false
		
	if direction.y == 0:
		new_dir = Vector2.LEFT if direction.x < 0 else Vector2.RIGHT
	elif direction.x == 0:
		new_dir = Vector2.UP if direction.y < 0 else Vector2.DOWN
	
	if new_dir == cardinal_direction:
		return false
	
	cardinal_direction = new_dir
	sprite.scale.x = -1 if cardinal_direction == Vector2.LEFT else 1
	return true 
	
	

# Cập nhật animation cho nhân vật dựa theo trạng thái và hướng quay mặt của nhân vật
func UpdateAnimation(state: String) -> void:
	animation_player.play( state + "_" + DirTranslate() )
	pass
	

func DirTranslate() -> String:
	if cardinal_direction == Vector2.DOWN:
		return "Down"
	elif cardinal_direction == Vector2.UP:
		return "Up"
	return "Side"
