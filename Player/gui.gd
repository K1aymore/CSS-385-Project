extends Control

var shots := 6

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass



func _input(event: InputEvent) -> void:
	if event is InputEventMouseButton && event.is_pressed():
		if shots > 0:
			shots -= 1
			$Shots.value = shots