extends Node2D

func _on_NewGameButton_pressed():
# warning-ignore:unused_variable
	var NewGameButton
	NewGameButton = get_tree().change_scene('res://World/GameScene.tscn')



func _on_Screen_finished():
	$Screen.play()


func _on_AudioStreamPlayer_finished():
	$Screen/Intro.play()


func _on_LoadsButton_pressed():
	SaveGame.load_scene(get_tree(),"res://data/save_slots/snapshot0.tscn")
