extends RigidBody3D

var alive := true

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _input_event(camera: Camera3D, event: InputEvent, event_position: Vector3, normal: Vector3, shape_idx: int) -> void:
	if event is InputEventMouseButton && event.is_pressed() && Player.shots >= 0:
		apply_impulse(normal * -50, event_position)
		alive = false


func hitByBox():
	queue_free()
