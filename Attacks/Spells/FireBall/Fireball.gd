extends Area2D

var velocity = Vector2.ZERO
var acceleration = 300
var speed = 50

onready var sprite = $Sprite
var MP = PersonalStats.magic_point
var magical_damage = PersonalStats.magical_weapon_damage
var damage = MP * magical_damage 


func _physics_process(delta):
	global_position = Vector2(speed*delta,speed*delta)


func _on_Fireball_area_entered(area):
	queue_free()
	area.damage = 5
