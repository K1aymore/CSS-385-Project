extends Control

var shots : float = 6.0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	
	shots = clamp(shots, -1, 6)
	$Shots.amount = shots



func _input(event: InputEvent) -> void:
	if event is InputEventMouseButton && event.is_pressed():
		shots -= 1
