extends CharacterBody2D

@export var jump_speed = -250
@export var speed = 50
@export var max_speed = 250
@export var health = 100
@export var cooldown = 100
var score = 0
var isAlive = true
@onready var netural_node = $neutral_animation
@onready var netural_anim = $neutral_animation/AnimationPlayer
@onready var accel_node = $acceleration_animation
@onready var accel_anime = $acceleration_animation/AnimationPlayer
@onready var deccel_node = $decceleration_animation
@onready var deccel_anime = $decceleration_animation/AnimationPlayer

	
func _ready() -> void:
	#Player setup
	netural_node.set_visible(true)
	netural_anim.play("Netural")
	accel_node.set_visible(false)
	deccel_node.set_visible(false)
	
func _physics_process(delta: float) -> void:
	move_toward(velocity.x, position.x + 1, speed)
	
	if isAlive:
		#Gravity
		if not is_on_floor():
			velocity += get_gravity() * delta
			
		#Jump
		if Input.is_action_just_pressed("Jump") and is_on_floor():
			velocity.y = jump_speed
		
		
		#Accerate and Deccelerate
		if Input.is_action_pressed("Accerlate"):
			if not accel_node.is_visible():
				#Hide animations and sprites
				netural_node.set_visible(false)
				netural_anim.stop()
				deccel_node.set_visible(false)
				deccel_anime.stop()
				
				#play animation
				accel_node.set_visible(true)
				accel_anime.play("Accelerate")
				
			velocity.x = move_toward(velocity.x, 300, speed * 2)
			print(velocity.x)
			
		if Input.is_action_pressed("Deccelerate"):
			if not deccel_node.is_visible():
				#Hide animations and sprites
				accel_node.set_visible(false)
				accel_anime.stop()
				netural_node.set_visible(false)
				netural_anim.stop()
				
				#play animation
				deccel_node.set_visible(true)
				deccel_anime.play("Deccelerate")
			velocity.x = move_toward(velocity.x, -100, speed / 1.5)
			print(velocity.x)
		
		if !Input.is_anything_pressed():
			if not netural_node.is_visible():
				#Hide animations and sprites
				accel_node.set_visible(false)
				accel_anime.stop()
				deccel_node.set_visible(false)
				deccel_anime.stop()
				
				#play animation
				netural_node.set_visible(true)
				netural_anim.play("Netural")
			velocity.x = move_toward(velocity.x, 240 , speed)


		move_and_slide()
