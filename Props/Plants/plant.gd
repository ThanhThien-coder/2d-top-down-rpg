extends Node


@onready var hurt_box: HurtBox = $HurtBox


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	hurt_box.Damaged.connect(TakeDamage)
	pass # Replace with function body.


func TakeDamage() -> void:
	queue_free()
	pass
