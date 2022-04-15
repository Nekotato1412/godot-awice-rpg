extends Node2D
class_name Event


export (Globals.Triggers) var trigger
export (Resource) var blockgroup

func _on_Player_ready():
	if trigger == Globals.Triggers.AUTORUN:
		var player = get_parent().get_node("Player")
		blockgroup.run({"player": player})

func _process(delta):
	if trigger == Globals.Triggers.PARALLEL:
		blockgroup.run({})

	
func get_class():
	return "Event"

func is_class(value):
	if value == "Event":
		return true
	else:
		return false
func get_trigger():
	return trigger

func _on_Area2D_body_entered(body):
	if trigger == Globals.Triggers.TOUCH:
		if body.is_class("Player"):
			blockgroup.run({"player": body})
