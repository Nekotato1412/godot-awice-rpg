extends Resource

export var title = "freeze"
var done = false
func run(args): 
	if args.has("player"):
		args["player"].Movement = false
		args["player"].Interact = false
		print("Player frozen.")
		done = true
	else:
		printerr(title + " is missing arguments! Is this a parellel process?")
