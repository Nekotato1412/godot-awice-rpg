tool
extends EditorPlugin

func _enter_tree():
	add_autoload_singleton("Globals", "res://addons/awice_rpg/globals.gd")


func _exit_tree():
	remove_autoload_singleton("Globals")
