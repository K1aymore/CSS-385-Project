extends TextureRect

var amount : float = 6.0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	
	for i in 6:
		if i < floor(amount):
			get_child(i).show()
		else:
			get_child(i).hide()
