extends Spatial

onready var pitch = $yaw/pitch
onready var yaw = $yaw
var camrot_pitch = 0
var camrot_yaw = 0

func _ready():
	$yaw/pitch/ClippedCamera.add_exception(get_parent())

func _input(event):
	if event is InputEventMouseMotion:
		camrot_pitch -= event.relative.y
		camrot_yaw  -= event.relative.x

func _physics_process(delta):
	yaw.rotation_degrees.y = camrot_yaw
	pitch.rotation_degrees.x = camrot_pitch
