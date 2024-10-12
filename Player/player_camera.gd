extends Camera3D


@export var hidePoint : Node3D
@export var outPoint : Node3D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	
	var newPoint : Node3D
	
	if Input.is_action_pressed("leanOut"):
		newPoint = outPoint
	else:
		newPoint = hidePoint
	
	
	position = lerp(position, newPoint.position, 10 * delta)
	rotation = lerp(rotation, newPoint.rotation, 10 * delta)
	
	if position.distance_to(hidePoint.position) < 0.1:
		Player.shots += delta * 4.5
	
