extends CharacterBody2D

@onready var Joystick = $"../CanvasLayer/Joystick"
@onready var AnimTree = $Animation/AnimationTree
@onready var AnimState = AnimTree.get("parameters/playback")

const Speed = 40

func _physics_process(_delta):
	var Dir = Joystick.direction()
	velocity = Dir
	
	var StatsDir = Joystick.slowrun()
	if StatsDir == "idle":
		velocity = Dir
		AnimTree.set("parameters/Idle/blend_position", Dir)
		AnimState.travel("Idle")
	elif StatsDir == "slow":
		velocity = Dir * Speed
		AnimTree.set("parameters/Walk/blend_position", Dir)
		AnimState.travel("Walk")
	elif StatsDir == "walk":
		velocity = Dir * Speed * 1.5
	elif StatsDir == "run":
		velocity = Dir * Speed * 2.5
	move_and_slide()
