extends CanvasLayer

# warning-ignore:unused_signal
signal save_requested

# warning-ignore:unused_signal
signal reload_requested

func set_visible(is_visible):
	for node in get_children():
		node.visible = is_visible

func _ready():
	set_visible(false)
func _input(event):
	if event.is_action_pressed("ui_cancel"):
		set_visible(!get_tree().paused )
		get_tree().paused = true
func _on_ContinueButton_pressed():
	get_tree().paused = false
	set_visible(false)

func _on_ExitButton_pressed():
	get_tree().paused = false
	set_visible(false)
# warning-ignore:return_value_discarded
	get_tree().change_scene("res://Mainmenu.tscn")

func _on_OptionsButton_pressed():
	pass # Replace with function body.


func _on_LoadButton_pressed():
	$TextureRect.load_scene(get_tree(),"res://data/save_slots/snapshot0.tscn")


func _on_SaveButton_pressed():
	$TextureRect.save_scene(get_tree(),"res://data/save_slots/snapshot0.tscn")
