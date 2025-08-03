extends CharacterBody2D

@export var random_speed = false
@export var speed = 50
@export var min_speed = -250
@export var max_speed = 250
@export  var isAlive: bool = true
@onready var mouse_alive = $Walk
@onready var mouse_alive_anim = $Walk/AnimationPlayer
@onready var mouse_dead = $Dead
@onready var mouse_dead_anime = $Dead/AnimationPlayer
@onready var path = $".."

func _ready() -> void:
	#if Level designer does not have a speed choice. Randomly pick a speed between the range of Min and Max speed.
	if random_speed:
		speed = randi_range(min_speed, max_speed)
	mouse_alive.set_visible(true)
	mouse_alive.set_flip_h(true)
	mouse_alive_anim.play("Walk")
	mouse_dead.set_visible(false)
	mouse_dead_anime.stop()


func _physics_process(delta: float) -> void:
	if Input.is_action_just_pressed("Jump"):
		
		self.queue_free()
	if isAlive:
		
		
		path.progress += speed * delta
		
		if(path.progress_ratio > 0.5):
			mouse_alive.set_flip_h(false)
		else:
			mouse_alive.set_flip_h(true)
	
