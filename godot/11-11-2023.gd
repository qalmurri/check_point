extends CharacterBody2D
@export var speed = 100
@onready var animated_player = $animated

func get_input():
	var input_direction = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	velocity = input_direction * speed

	if velocity.length() > 0:
		update_animation()
		print(velocity)
	else:
		animated_player.stop()

func update_animation():
	if velocity.x > 0:
		animated_player.play("45")
		animated_player.flip_h = false
	elif velocity.x < 0:
		animated_player.play("45")
		animated_player.flip_h = true
	elif velocity.y > 0:
		animated_player.play("90")
	elif velocity.y < 0:
		animated_player.play("0")

func _physics_process(delta):
	get_input()
	move_and_slide()
