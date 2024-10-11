extends RigidBody3D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _input_event(camera: Camera3D, event: InputEvent, event_position: Vector3, normal: Vector3, shape_idx: int) -> void:
	if event is InputEventMouseButton && event.is_pressed() && Player.shots > 0:
		freeze = false;




func _on_body_entered(body: Node) -> void:
	if body.has_method("hitByBox"):
		body.hitByBox()
