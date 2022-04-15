extends KinematicBody2D
class_name Player
export (int) var Speed = 1
export (bool) var Movement = true
export (bool) var Interact = true
export (bool) var Sprint = true
export (int) var SprintMultiplier = 2
export (int) var BaseSpeed = 64

func _physics_process(delta):
	var velocity = Vector2.ZERO
	var localSpeed = Speed * BaseSpeed
	
	if Input.is_action_pressed("move_left"):
		if Movement != true: return
		velocity.x -= 1
	if Input.is_action_pressed("move_right"):
		if Movement != true: return
		velocity.x += 1
		
	if Input.is_action_pressed("move_up"):
		if Movement != true: return
		velocity.y -= 1
	if Input.is_action_pressed("move_down"):
		if Movement != true: return
		velocity.y += 1
	if Input.is_action_pressed("sprint"):
		if Movement != true: return
		localSpeed = localSpeed * SprintMultiplier
	
	if velocity.length() != 0:
		var angle = atan2(-velocity.x, velocity.y)
		$RayCast2D.global_rotation = angle
		
		if velocity.x > 0:
			$Sprite.play("walk_right")
		elif velocity.x < 0:
			$Sprite.play("walk_left")
		if velocity.y > 0:
			$Sprite.play("walk_down")
		elif velocity.y < 0:
			$Sprite.play("walk_up")		
	else:
		var direction = abs(floor($RayCast2D.global_rotation))
		if direction == 0:
			$Sprite.play("idle_down")
		elif direction == 1:
			$Sprite.play("idle_left")
		elif direction == 3:
			$Sprite.play("idle_up")
		elif direction == 2:
			$Sprite.play("idle_right")	
		
	if Interact:
		if Input.is_action_just_pressed("interact"):
			if $RayCast2D.is_colliding():
				var collider = $RayCast2D.get_collider().get_parent()
				if collider.is_class("Event"):
					if collider.get_trigger() == Globals.Triggers.ACTION:
						collider.blockgroup.run({"player": self})
	
	
	move_and_collide((velocity.normalized() * localSpeed) * delta)
	
func get_class():
	return "Player"

func is_class(value):
	return value == "Player"
