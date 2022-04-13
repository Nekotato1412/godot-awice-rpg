extends Node2D
class_name Event

export (Globals.Triggers) var trigger

func _on_Player_ready():
	if trigger == Globals.Triggers.AUTORUN:
		var player = get_parent().get_node("Player")
		run(player)

func _process(delta):
	if trigger == Globals.Triggers.PARALLEL:
		run()

	
func get_class():
	return "Event"

func is_class(value):
	if value == "Event":
		return true
	else:
		return false
func get_trigger():
	return trigger

func run(player=null):
	if player != null:
		print(player)
	else:
		print("Statement.")


func _on_Area2D_body_entered(body):
	if trigger == Globals.Triggers.TOUCH:
		if body.is_class("Player"):
			run(body)
