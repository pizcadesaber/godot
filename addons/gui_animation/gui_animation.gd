tool
extends EditorPlugin


func _enter_tree():
	add_custom_type("TransformContainer", "MarginContainer", preload("transform_container.gd"), preload("transform_container.png"))

func _exit_tree():
	remove_custom_type("TransformContainer")
