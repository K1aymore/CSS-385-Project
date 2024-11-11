extends Node3D

@onready var Player := %Player
@onready var camera := $PlayerCamera

@onready var outPoints := $out
@onready var hidePoints := $hide


var speed := 7

var dest : Node3D
var pointNum := 0

signal end

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	camera.transform = getCurPoint().transform



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	
	dest = getCurPoint()
	
	
	camera.position = lerp(camera.position, dest.position, speed * delta)
	camera.rotation.x = lerp_angle(camera.rotation.x, dest.rotation.x, speed * delta)
	camera.rotation.y = lerp_angle(camera.rotation.y, dest.rotation.y, speed * delta)
	camera.rotation.z = lerp_angle(camera.rotation.z, dest.rotation.z, speed * delta)
	
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
	if pointNum >= hidePoints.get_child_count():
		end.emit()
		pointNum = hidePoints.get_child_count() - 1
