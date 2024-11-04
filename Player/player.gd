extends Control

var level

var softwareCursor := false


var shots : float = 6.0
var faith := 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	level = get_parent().get_child(1)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	
	
	$Mouse.visible = softwareCursor
	if softwareCursor:
		Input.mouse_mode = Input.MOUSE_MODE_HIDDEN
		$Mouse.position = get_local_mouse_position()
	else:
		Input.mouse_mode = Input.MOUSE_MODE_VISIBLE
	
	
	shots = clamp(shots, -1, 6)
	$Shots.value = shots
	$FaithLabel.text = str("Noteriety: ", faith)
	



func _input(event: InputEvent) -> void:
	if event is InputEventMouseButton && event.is_pressed():
		shots -= 1
