extends KinematicBody2D
class_name Player
export (int) var Speed = 1
export (bool) var Movement = true
export (bool) var Interact = true
export (bool) var Sprint = true
export (int) var SprintMultiplier = 2
export (int) var BaseSpeed = 64

func toggleMovement():
	if Movement:
		Movement = false
	else:
		Movement = true	
func toggleInteract():
	if Interact:
		Interact = false
	else:
		Interact = true

func toggleFreeze():
	toggleInteract()
	toggleMovement()

func _physics_process(delta):
	var velocity = Vector2.ZERO
	var localSpeed = Speed * BaseSpeed
	
	if Input.is_action_pressed("move_left"):
		velocity.x -= 1
	if Input.is_action_pressed("move_right"):
		velocity.x += 1
		
	if Input.is_action_pressed("move_up"):
		velocity.y -= 1
	if Input.is_action_pressed("move_down"):
		velocity.y += 1
	if Input.is_action_pressed("sprint"):
		localSpeed = localSpeed * SprintMultiplier
	
	if velocity.length() != 0:
		var angle = atan2(-velocity.x, velocity.y)
		$RayCast2D.global_rotation = angle
	
	if Interact:
		if Input.is_action_just_pressed("interact"):
			if $RayCast2D.is_colliding():
				var collider = $RayCast2D.get_collider().get_parent()
				if collider.is_class("Event"):
					if collider.get_trigger() == Globals.Triggers.ACTION:
						collider.run(self)
	
	
	move_and_collide((velocity.normalized() * localSpeed) * delta)
	
func get_class():
	return "Player"

func is_class(value):
	if value == "Player":
		return true
	else:
		return false
