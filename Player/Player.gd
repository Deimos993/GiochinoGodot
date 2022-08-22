extends KinematicBody2D


export var ACCELERATION = 500
export var MAX_SPEED = 80
export var ROLL_SPEED = 120
export var FRICTION = 500

enum {
	MOVE,
	ROLL,
	ATTACK
}

var state = MOVE
var velocity = Vector2.ZERO
var roll_vector = Vector2.DOWN
signal FirstSpell
onready var animationPlayer = $AnimationPlayer
onready var animationTree = $AnimationTree
onready var animationState = animationTree.get("parameters/playback")
onready var swordHitbox = $HitboxPivot/SwordHitbox
onready var hurtbox = $Hurtbox
func _ready():
	randomize()
# warning-ignore:return_value_discarded
	PersonalStats.connect("no_health", self, "queue_free")
	animationTree.active = true
	swordHitbox.knockback_vector = roll_vector
	

func _physics_process(delta):
	match state:
		MOVE:
			move_state(delta)
		
		ROLL:
			roll_state()
		
		ATTACK:
			attack_state()
	
func move_state(delta):
	var input_vector = Vector2.ZERO
	input_vector.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	input_vector.y = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
	input_vector = input_vector.normalized()
	
	if input_vector != Vector2.ZERO:
		roll_vector = input_vector
		swordHitbox.knockback_vector = input_vector
		animationTree.set("parameters/Idle/blend_position", input_vector)
		animationTree.set("parameters/Run/blend_position", input_vector)
		animationTree.set("parameters/Attack/blend_position", input_vector)
		animationTree.set("parameters/Roll/blend_position", input_vector)
		animationState.travel("Run")
		velocity = velocity.move_toward(input_vector * MAX_SPEED, ACCELERATION * delta)
	else:
		animationState.travel("Idle")
		velocity = velocity.move_toward(Vector2.ZERO, FRICTION * delta)
	
	move()
	
	if Input.is_action_just_pressed("roll"):
		state = ROLL
	
	if Input.is_action_pressed("attack"):
		state = ATTACK
		
func roll_state():
	velocity = roll_vector * ROLL_SPEED
	animationState.travel("Roll")
	move()

func attack_state():
	velocity = Vector2.ZERO
	animationState.travel("Attack")

func move():
	velocity = move_and_slide(velocity)

func roll_animation_finished():
	velocity = velocity * 0.8
	state = MOVE

func attack_animation_finished():
	state = MOVE

func _on_Hurtbox_area_entered(area):
	PersonalStats.health -= area.damage
	hurtbox.start_invincibility(0.6)
	hurtbox.create_hit_effect()
	
	
func _on_Hurtbox_invincibility_started():
	pass

func _on_Hurtbox_invincibility_ended():
	pass


# warning-ignore:unused_argument
func _on_PersonalStats_level_up(value):
	#animazioni
	pass

# warning-ignore:unused_argument
func _on_PersonalStats_exp_increment(value):
	#animazioni
	pass

# warning-ignore:unused_argument
func _on_PersonalStats_health_changed(value):
	#animazioni
	pass

func _on_PersonalStats_no_health():
#	fine partita, restarta il gioco
	pass

func _on_healtimer_timeout():
	if PersonalStats.health < PersonalStats.max_health:
		PersonalStats.health += 1
	else:
		PersonalStats.health = PersonalStats.max_health
func _on_manatimer_timeout():
	if PersonalStats.mana < PersonalStats.max_mana:
		PersonalStats.mana += 1
	else:
		PersonalStats.mana = PersonalStats.max_mana



func _on_Camera2D_FirstSpell():
	emit_signal("FirstSpell")
