extends KinematicBody2D

export (int) var speed = 1200
export (int) var jump_speed = -1800
export (int) var gravity = 4000

var velocity = Vector2.ZERO

var Fishs = 0

var spawn = Vector2(75, 210)


onready var player = $AnimationPlayer
onready var spr = $Sprite

func _ready():
	player.play("Idle")
	spawn.x = 75
	spawn.y = 210
func get_input():
	if Input.is_action_pressed("right"):
		spr.set_flip_h(false)
		velocity.x = speed
	if Input.is_action_pressed("left"):
		spr.set_flip_h(true)
		velocity.x = speed * -1
	if not(Input.is_action_pressed("left")) and not(Input.is_action_pressed("right")):
		velocity.x = 0
	

func SpawnTP():
	position = spawn

func _physics_process(delta):
	$Area2D.position = self.position
	if velocity.x > 0:
		player.play("Walk Right")
	elif velocity.x < 0:
		player.play("Walk Left")
	else:
		player.play("Idle")
	get_input()
	
	velocity.y += gravity * delta
	if Input.is_action_pressed("up"):
		if is_on_floor():
			velocity.y = jump_speed

	velocity = move_and_slide(velocity, Vector2.UP)
	if velocity.y < 0:
		player.play("Jump")
	if velocity.y == 0 and (!is_on_floor()):
		player.play("fall0")
	if velocity.y > 0:
		player.play("Fall")
	

		


func _on_Killer_body_entered(body):
	if body == self:
		SpawnTP()
		


func _on_Fish2_body_entered(body):
	pass # Replace with function body.


func _on_Fish_body_entered(body):
	Fishs = 2
