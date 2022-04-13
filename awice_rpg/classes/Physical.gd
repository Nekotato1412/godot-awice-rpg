extends "Event.gd"

export (Texture) var icon

# Called when the node enters the scene tree for the first time.
func _ready():
	var sprite = Sprite.new()
	if icon != null:
		sprite.texture = icon
	
	add_child(sprite)	

func run(player=null):
	print("UwU")
