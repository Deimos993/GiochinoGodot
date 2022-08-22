extends Area2D
class_name Sword
var knockback_vector = Vector2.ZERO
var strenght = PersonalStats.force
var weapon_dmg = PersonalStats.weapon_dmg
export (int) var damage = strenght * weapon_dmg
