extends Control


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	hide()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	
	if Input.is_action_just_pressed("ui_cancel"):
		if visible:
			resumeGame()
		else:
			pauseGame()



func pauseGame():
	get_tree().paused = true
	
	show()


func resumeGame():
	get_tree().paused = false
	
	hide()



func _on_resume_button_pressed() -> void:
	resumeGame()


func _on_save_button_pressed() -> void:
	get_parent().level.save()

func _on_load_button_pressed() -> void:
	get_parent().level.load()

func _on_quit_button_pressed() -> void:
	get_tree().quit()
