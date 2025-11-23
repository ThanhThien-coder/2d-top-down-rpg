class_name State_Attack
extends State


var attacking: bool = false

@export var attack_sound: AudioStream
@export_range(1,20) var decelerate_speed: int = 13

@onready var Idle: State = $"../Idle"
@onready var Walk: State = $"../Walk"
@onready var animation_player: AnimationPlayer = $"../../AnimationPlayer"
@onready var attack_effect: AnimationPlayer = $"../../Sprite2D/AttackEffect/AttackEffect"
@onready var audio: AudioStreamPlayer2D = $"../../Node/AudioStreamPlayer2D"


# What happens when player enter this state
func Enter() -> void:
	player.UpdateAnimation("Attack")
	attack_effect.play("Attack_" + player.DirTranslate() + "_Effect")
	attacking = true
	animation_player.animation_finished.connect(EndAttack)
	
	audio.stream = attack_sound
	audio.pitch_scale = randf_range(0.7, 1.3)
	audio.play()
	
	pass
 

# What happens when player exit this state
func Exit() -> void:
	animation_player.animation_finished.disconnect(EndAttack)
	attacking = false
	pass


# What happes during the _process update in this State
func Process( _delta: float ) -> State:
	player.velocity -= player.velocity * decelerate_speed * _delta 
	
	if not attacking:
		if player.direction == Vector2.ZERO:
			return Idle
		return Walk

	return null




# What happens during the _physic_process in this State
func Physics( _delta: float ) -> State:
	return null


# What happens with Input in this State
func HandleInput( _event: InputEvent ) -> State:
	return null



func EndAttack( _newAnimName: String ) -> void:
	attacking = false
