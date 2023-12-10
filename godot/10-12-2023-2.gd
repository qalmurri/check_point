extends TouchScreenButton

@onready var Joystick = $"."
@onready var Knob = $Knob
@onready var MaxDistance = shape.radius

var stick_center: Vector2 = texture_normal.get_size() / 2
var touched: bool = false

func _ready():
	set_process(false)

func _input(event):
	if event is InputEventScreenTouch:
		if event.pressed:
			set_process(true)
			inst(event.position)
			print("Joystick:", event.pressed)
		elif not event.pressed:
			set_process(false)
			Knob.position = stick_center
			print("Joystick:", event.pressed)

func _process(_delta):
	Knob.global_position = get_global_mouse_position()
	Knob.position = stick_center + (Knob.position - stick_center).limit_length(MaxDistance)

func inst(pos):
	Joystick.position = pos + Vector2(-71, -71)

func direction() -> Vector2:
	var dir = Knob.position - stick_center
	return dir.normalized()
	
func slowrun():
	var run = Knob.position - stick_center
	var IdleDir = 40
	var SlowDir = 100
	var RunDir = 200
	
	if run.length() < IdleDir:
		return "idle"
	elif run.length() >= IdleDir and run.length() < SlowDir:
		return "slow"
	elif run.length() >= SlowDir and run.length() < RunDir:
		return "walk"
	elif run.length() >= RunDir:
		return "run"
