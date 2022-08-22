extends Node2D

onready var animation_player = $PotionArea/AnimationPlayer

func _ready():
	animation_player.play("idle")


# warning-ignore:unused_argument
func _on_PotionArea_body_entered(body):   
	PersonalStats.max_health = PersonalStats.max_health + 1
	PersonalStats.health = PersonalStats.health + 1
	queue_free()
