extends CharacterBody2D
@onready var animated_player = $animated

const SPEED = 300.0
const JUMP_VELOCITY = -400.0

var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func _physics_process(delta):
	if not is_on_floor():
		velocity.y += gravity * delta

	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	var direction = Input.get_axis("ui_left", "ui_right")
	print(direction)
	
	if direction:
		velocity.x = direction * SPEED
		if velocity.x > 0:
			animated_player.play("45")
			animated_player.flip_h = false
		elif velocity.x < 0:
			animated_player.play("45")
			animated_player.flip_h = true
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		animated_player.stop()

	move_and_slide()
