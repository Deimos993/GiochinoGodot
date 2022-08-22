extends Control
var hearts = 1 setget set_hearts
var max_hearts = 1 setget set_max_hearts
onready var label2 = $Label2
onready var label4 = $Label4
var mana = 1 setget set_mana
var max_mana = 1 setget set_max_mana
var leveling = 1 setget set_leveling
var max_leveling = 1 setget set_max_leveling
onready var label = $Label
var eXping = 1 setget set_exping
var max_exping = 1 setget set_max_exping
onready var label3 = $Label3

func set_hearts(value):
	hearts = clamp(value, 0, max_hearts)
	if label2 != null:
		label2.text = "HP =" + str(PersonalStats.health) + "/" + str(PersonalStats.max_health)
func set_max_hearts(value):
	max_hearts = max(value, 1)
	
func set_mana(value):
	mana = clamp(value, 0, max_mana)
	if label4 != null:
		label4.text = "Mana =" + str(PersonalStats.mana) + "/" + str(PersonalStats.max_mana)
func set_max_mana(value):
	max_mana = max(value, 1)
	
func set_leveling(value):
	leveling = clamp(value, 0, max_leveling)
	if label != null:
		label.text = "Lvl =" + str(PersonalStats.level)
func set_max_leveling(value):
	max_leveling = max(value, 1)

func set_exping(value):
	eXping = clamp(value, 0, max_exping)
	if label3 != null:
		label3.text = "ExP Req =" + str(PersonalStats.eXp_required) +"/"+ str(PersonalStats.eXp_required + PersonalStats.eXp_total)
func set_max_exping(value):
	max_exping = max(value, 1)

func _ready():
	self.max_hearts = PersonalStats.max_health
	self.hearts = PersonalStats.health
# warning-ignore:return_value_discarded
	PersonalStats.connect("health_changed", self, "set_hearts")
	self.max_mana = PersonalStats.max_mana
	self.mana = PersonalStats.mana
# warning-ignore:return_value_discarded
	PersonalStats.connect("mana_changed", self, "set_mana")
	self.leveling = PersonalStats.level
# warning-ignore:return_value_discarded
	PersonalStats.connect("level_up", self,"set_leveling")
	#self.max_exping = PersonalStats.eXp_total
	self.eXping = PersonalStats.eXp_required
# warning-ignore:return_value_discarded
	PersonalStats.connect("exp_increment", self,"set_exping")
