tool
extends EditorPlugin


func _enter_tree():
	add_custom_type("SlidingContainer", "MarginContainer", preload("sliding_container.gd"), preload("sliding_container.png"))

func _exit_tree():
	remove_custom_type("SlidingContainer")
