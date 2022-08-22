extends Area2D


func _ready():
	pass


# warning-ignore:unused_argument
func _on_Checkpoint_body_entered(body):
	Checkpoint.last_position = global_position
	$AnimationPlayer.play("idle")

