extends Control

var level

var softwareCursor := true


var shots : float = 6.0
var faith := 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$PauseMenu.hide()
	$EndScreen.hide()
	
	level = get_parent().get_child(1)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	
	$Mouse.enabled = softwareCursor
	
	shots = clamp(shots, -1, 6)
	$Shots.value = shots
	$FaithLabel.text = str("Notoriety: ", faith)
	



func _input(event: InputEvent) -> void:
	if event is InputEventMouseButton && event.is_pressed():
		shots -= 1


func _on_path_end() -> void:
	get_tree().paused = true
	$EndScreen.show()
	%NotorietyEndLabel.text = "Notoriety: " + str(faith)


func _on_end_quit_button_pressed() -> void:
	get_tree().quit()
