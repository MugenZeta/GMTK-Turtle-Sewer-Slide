extends Node2D

@export_enum("Watemelon","Lettus","Toxic_Barrel") var item_ID: int
@export var health_value : int = 0

func _ready() -> void:
	item_ID = randi_range(0,2)
	match item_ID:
		0:
			health_value = 30
		1:
			health_value = 10
		2:
			health_value = 100
		
		
