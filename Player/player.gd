extends Control

var shots : float = 6.0
var faith := 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Input.mouse_mode = Input.MOUSE_MODE_HIDDEN


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	
	if Input.is_action_just_pressed("ui_cancel"):
		get_tree().quit()
	
	$Mouse.position = get_local_mouse_position()
	
	shots = clamp(shots, -1, 6)
	$Shots.value = shots
	$FaithLabel.text = str("Noteriety: ", faith)
	
	
	



func _input(event: InputEvent) -> void:
	if event is InputEventMouseButton && event.is_pressed():
		shots -= 1
