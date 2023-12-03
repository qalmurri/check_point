extends TouchScreenButton

@onready var Knob = $Knob
@onready var max_distance = shape.radius

var stick_center: Vector2 = texture_normal.get_size() / 2
var touched: bool = false

func _ready():
	set_process(false)
	
func _input(event):
	if event is InputEventScreenTouch:
		if event.pressed:
			set_process(true)
			print("Press:", event.pressed)
		elif not event.pressed:
			set_process(false)
			print("Press:", event.pressed)
			Knob.position = stick_center	
			
func _process(_delta):
	Knob.global_position = get_global_mouse_position()
	Knob.position = stick_center + (Knob.position - stick_center).limit_length(max_distance)

	var run = Knob.position - stick_center
	var RunPlayer = 120
	if run.length() < RunPlayer:
		print("Walk")
	elif run.length() >= RunPlayer:
		print("Run")

func get_joystick_dir() -> Vector2:
	var dir = Knob.position - stick_center
	return dir.normalized()
