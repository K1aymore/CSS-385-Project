extends Control


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$Menu.hide()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("ui_cancel"):
		$Menu.hide()


func _on_play_button_pressed() -> void:
	get_tree().change_scene_to_file("res://Levels/level1.tscn")


func _on_help_button_pressed() -> void:
	$Menu.show()


func _on_quit_button_pressed() -> void:
	get_tree().quit()
