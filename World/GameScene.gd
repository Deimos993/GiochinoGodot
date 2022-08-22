extends Node2D
var FireBallScene = preload("res://Attacks/Spells/FireBall/Fireball.tscn")
onready var player = $Player


# warning-ignore:unused_argument
func _physics_process(delta):
	if Input.is_action_just_pressed("6"):
		if PersonalStats.mana >= 5:
			PersonalStats.mana -= 5 
			var FireBall = FireBallScene.instance()
			FireBall.global_position = player.global_position
			add_child(FireBall) 
	elif PersonalStats.mana == 0:
		#messaggio no mana
		pass
	elif PersonalStats.mana <= 0:
		#messaggio no mana
		pass
			


func _enter_tree():
	if Checkpoint.last_position:
		$Player.global_position = Checkpoint.last_position
func _on_FirstSong_finished():
	$FirstSong.play()


func _on_Player_FirstSpell():
	if PersonalStats.mana >= 5:
			PersonalStats.mana -= 5 
			var FireBall = FireBallScene.instance()
			FireBall.global_position = player.global_position
			add_child(FireBall) 
	elif PersonalStats.mana == 0:
		#messaggio no mana
		pass
	elif PersonalStats.mana <= 0:
		#messaggio no mana
		pass
