extends Node
export (int) var  force = 1
export (int) var  max_health = 1
export (int) var level = 1
onready var health = max_health setget set_health

signal no_health

signal health_changed(value)
func _ready():
	if level == 2:
		self.health = health +2
		self.max_health = max_health +2
		self.force = force +1
	elif level ==3:
		self.health = health +5
		self.max_health = max_health +5
		self.force = force +2
func set_health(value):
	health = value
	emit_signal("health_changed", health)
	if health <=0:
		emit_signal("no_health")
		PersonalStats.gain_experience(10)
	elif level ==2 and health <= 0 :
		PersonalStats.gain_experience(15)
	elif level ==3 and health <= 0 :
		PersonalStats.gain_experience(23)
