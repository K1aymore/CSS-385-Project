extends Node3D

@onready var Player := %Player
@onready var Enemies : Node3D = %Enemies


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func load():
	var enemyScene := preload("res://World/enemy.tscn")
	
	if not FileAccess.file_exists("user://savegame.json"):
		print("savegame.save does not exist")
		return # Error! We don't have a save to load.
	
	# delete starting enemies
	for enemy in Enemies.get_children():
		print("deleting ", enemy)
		enemy.queue_free()
	
	
	var saveFile = FileAccess.open("user://savegame.json", FileAccess.READ)
	
	while saveFile.get_position() < saveFile.get_length():
		
		var jsonString = saveFile.get_line()
		# Creates the helper class to interact with JSON.
		var json = JSON.new()
		
		# Check if there is any error while parsing the JSON string, skip in case of failure.
		var parseResult = json.parse(jsonString)
		if not parseResult == OK:
			print("JSON Parse Error: ", json.get_error_message(), " in ", jsonString, " at line ", json.get_error_line())
			continue
		
		# Get the data from the JSON object.
		var nodeData = json.data
		
		# Firstly, we need to create the object and add it to the tree and set its position.
		var newEnemy := enemyScene.instantiate()
		
		# Now we set the remaining variables.
		for i in nodeData.keys():
			match i:
				"pos-x":
					newEnemy.position.x = nodeData["pos-x"]
				"pos-y":
					newEnemy.position.y = nodeData["pos-y"]
				"pos-z":
					newEnemy.position.z = nodeData["pos-z"]
				"rot-x":
					newEnemy.rotation.x = nodeData["rot-x"]
				"rot-y":
					newEnemy.rotation.y = nodeData["rot-y"]
				"rot-z":
					newEnemy.rotation.z = nodeData["rot-z"]
		
		Enemies.add_child(newEnemy)
	
	
	
	saveFile.close()




func save():
	var saveFile := FileAccess.open("user://savegame.json", FileAccess.WRITE)
	
	print(saveFile)
	
	for enemy in Enemies.get_children():
		var saveData  = {
			"pos-x": enemy.position.x,
			"pos-y": enemy.position.y,
			"pos-z": enemy.position.z,
			"rot-x": enemy.rotation.x,
			"rot-y": enemy.rotation.y,
			"rot-z": enemy.rotation.z,
		}
		
		var jsonString = JSON.stringify(saveData)
		saveFile.store_line(jsonString)
	
	
	saveFile.close()
