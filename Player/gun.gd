extends CharacterBody3D

@export var camera : Camera3D

var startPos : Vector3

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	startPos = position


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var mousePosition2D = get_viewport().get_mouse_position()
	var dropPlane  = Plane(Vector3(0, 0, -1), 10000)
	
	var position3D = dropPlane.intersects_ray(
							 camera.project_ray_origin(mousePosition2D),
							 camera.project_ray_normal(mousePosition2D))
	
	if position3D != null:
		var oldRot = rotation
		look_at(position3D)
		var collision = move_and_collide(Vector3.ZERO, true)
		if collision != null:
			rotation = oldRot
		position = startPos
