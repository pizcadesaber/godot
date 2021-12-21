tool
extends MarginContainer

export(Vector2) var offset = Vector2(0,0) setget set_offset
export(Vector2) var scale = Vector2(1,1) setget set_scale

func set_offset(vector: Vector2):
	if offset == vector:
		return
	offset = vector
	set_transform(offset, scale)

func set_scale(vector: Vector2):
	if scale == vector:
		return
	scale = vector
	set_transform(offset, scale)

func set_transform(offset_vector: Vector2, scale_vector: Vector2):
	var size = rect_size / 2
	scale_vector = (Vector2(1,1) - scale_vector)
	add_constant_override("margin_left",
			scale_vector.x * size.x + offset_vector.x)
	add_constant_override("margin_right",
			scale_vector.x * size.x - offset_vector.x)
	add_constant_override("margin_bottom", 
			scale_vector.y * size.y + offset_vector.y)
	add_constant_override("margin_top", 
			scale_vector.y * size.y - offset_vector.y)
