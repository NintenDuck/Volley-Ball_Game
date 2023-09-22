extends CharacterBody2D

@export var spd = 0
@export var jump_force = 0
@export var GRAVITY = 0

var dir = 0


func _ready() -> void:
	pass

func _process(delta: float) -> void:
	move()
	apply_gravity()
	check_jump()
	

func move():
	dir = int( Input.is_action_pressed('k_right') ) - int( Input.is_action_pressed('k_left') )
	
	if dir != 0:
		velocity.x = ( spd * dir )
	else:
		velocity.x = 0
		
	move_and_slide()


func apply_gravity():
	if !is_on_floor():
		velocity.y += GRAVITY


func check_jump():
	if not is_on_floor():return
	
	if ( Input.is_action_just_pressed('k_jump') ):
		print("Just jumped!")
		jump( jump_force )

func jump( force ):
	velocity.y -= force
