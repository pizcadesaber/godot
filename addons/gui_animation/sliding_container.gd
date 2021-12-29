tool
extends MarginContainer

export(Vector2) var offset = Vector2(0,0) setget set_offset
export(Vector2) var scale = Vector2(1,1) setget set_scale
export(Vector2) var pivot = Vector2(0.5, 0.5) setget set_pivot

func set_offset(vector: Vector2):
	if offset == vector:
		return
	offset = vector
	set_transform()

func set_pivot(vector: Vector2):
	if pivot == vector:
		return
	pivot = vector
	set_transform()

func set_scale(vector: Vector2):
	if scale == vector:
		return
	scale = vector
	set_transform()

func set_transform():
	var vector = (Vector2(1,1) - scale)
	add_constant_override("margin_left",
			vector.x * rect_size.x * pivot.x + offset.x)
	add_constant_override("margin_right",
			 vector.x * rect_size.x * (1 - pivot.x) - offset.x)
	add_constant_override("margin_bottom", 
			vector.y * rect_size.y * pivot.y + offset.y)
	add_constant_override("margin_top",
			 vector.y * rect_size.y * (1 - pivot.y) - offset.y)
