extends Sprite2D

var enabled := false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	
	if enabled:
		Input.mouse_mode = Input.MOUSE_MODE_HIDDEN
		position = get_global_mouse_position()
		show()
	else:
		Input.mouse_mode = Input.MOUSE_MODE_VISIBLE
		hide()
