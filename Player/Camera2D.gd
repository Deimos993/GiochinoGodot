extends Camera2D

signal FirstSpell

func _on_FirstSpell_pressed():
	emit_signal("FirstSpell")
