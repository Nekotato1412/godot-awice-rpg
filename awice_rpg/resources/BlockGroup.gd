extends Resource

export var Blocks = []
var index = 0
var current
var base
	
func run(args):
	if !(index > Blocks.size() - 1):
		if !args.has("next"):
			if Blocks.size() != 0:
				base = args
				current = Blocks[0]
				current.run(args)
		else:
			current = args.next
			current.run(base)

		while true:
			if current.done:
				index += 1
				if index > Blocks.size() - 1: 
					index = 0
					current = null
					base = null
					return
				base["next"] = Blocks[index]
				run(base)
				break
