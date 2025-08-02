extends Camera2D
@export var scroll_speed = 1

func _physics_process(delta: float) -> void:
	position.x += scroll_speed
	force_update_scroll()
	
