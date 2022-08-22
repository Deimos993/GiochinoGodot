extends Node2D
onready var animation_player = $Area2D/AnimationPlayer
func _ready():
	animation_player.play("Flying")
