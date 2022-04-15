extends Resource

export var title = "unfreeze"
var done = false
func run(args): 
	if args["player"]:
		args["player"].Movement = true
		args["player"].Interact = true
		print("Player unfrozen.")
		done = true
	else:
		printerr(title + " is missing arguments! Is this a parellel process?")
		OS.exit_code(1)

