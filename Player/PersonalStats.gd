extends Node

onready var health = max_health setget set_health
onready var mana = max_mana setget set_mana
export (int) var  force = 1
export (int) var  weapon_dmg = 1
export (int) var  magic_point = 1
export (int) var  magical_weapon_damage = 1
export (int) var  max_health = 5
export (int) var  max_mana = 5
export (int) var level = 1
export (int) var eXp = 0
export (int) var eXp_total = 0
export (int) var eXp_required = get_required_exp(level +1)
var levels = [1,2,3,4,5,6,7,8,9,10,
			11,12,13,14,15,16,17,18,19,20,
			 21,22,23,24,25,26,27,28,29,30
			]

signal no_health
signal health_changed(value)
signal no_mana
signal mana_changed(value)
signal level_up(value)
signal exp_increment(value)

# warning-ignore:shadowed_variable
func get_required_exp(level):
	return round(pow(level, 1.8) + level * 10)
func gain_experience(amount):
	eXp_total += amount
	eXp += amount
	while eXp >= eXp_required:
		eXp -= eXp_required
		emit_signal("exp_increment", eXp)
		level_up()
	
func set_health(value):
	health = value
	emit_signal("health_changed", health)
	if health <=0:
		emit_signal("no_health")
		
func set_mana(value):
	mana = value
	emit_signal("mana_changed", mana)
	if mana <=0:
		emit_signal("no_mana")
		
func level_up():
	level += 1
	self.eXp_required = get_required_exp(level +1)
	emit_signal("level_up", level)
	self.max_health = max_health +3
	self.health = health +3
	self.max_mana = max_mana +2
	self.mana = mana +2
	self.force = force +1
	self.magic_point = magic_point +1
