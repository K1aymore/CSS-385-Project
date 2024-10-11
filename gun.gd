extends Node3D

@export var camera : Camera3D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var mousePosition2D = get_viewport().get_mouse_position()
	var dropPlane  = Plane(Vector3(0, 0, -1), 100)
	
	var position3D = dropPlane.intersects_ray(
							 camera.project_ray_origin(mousePosition2D),
							 camera.project_ray_normal(mousePosition2D))
	
	look_at(position3D)
