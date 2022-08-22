extends Sprite

export (String, FILE, "*.tscn") var target_scene

# warning-ignore:unused_argument
func _on_Area2D_area_entered(area):
# warning-ignore:return_value_discarded
	get_tree().change_scene(target_scene)


# warning-ignore:unused_argument
func _on_Area2D_body_entered(body):
# warning-ignore:return_value_discarded
	get_tree().change_scene(target_scene)
