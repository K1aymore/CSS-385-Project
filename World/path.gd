extends Node3D

@onready var Player := %Player
@onready var camera := $PlayerCamera

@onready var outPoints := $out
@onready var hidePoints := $hide


var speed := 8

var dest : Node3D
var pointNum := 0


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	camera.transform



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	
	dest = getCurPoint()
	
	
	camera.position = lerp(camera.position, dest.position, speed * delta)
	camera.rotation = lerp(camera.rotation, dest.rotation, speed * delta)
	
	if camera.position.distance_to(getCurPoint(true).position) < 0.1:
		Player.shots += delta * 4.5




func getCurPoint(hide = null) -> Node3D:
	
	if hide == true:
		return hidePoints.get_child(pointNum)
	
	if Input.is_action_pressed("leanOut") || hide == false:
		return outPoints.get_child(pointNum)
	else:
		return hidePoints.get_child(pointNum)



func _on_timer_timeout() -> void:
	pointNum += 1
