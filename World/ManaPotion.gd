extends Node2D

onready var animation_player = $PotionArea/AnimationPlayer

func _ready():
	animation_player.play("idle")


# warning-ignore:unused_argument
func _on_PotionArea_body_entered(body):   
	PersonalStats.max_mana = PersonalStats.max_mana + 2
	PersonalStats.mana = PersonalStats.mana + 2
	queue_free()
