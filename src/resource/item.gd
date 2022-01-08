tool
class_name Item
extends Resource

enum Rarity {
	COMMON,
	UNCOMMON,
	RARE,
	EPIC,
	LEGENDARY,
	MYTHIC,
}

export(String) var name: String = ""
export(String, MULTILINE) var desc: String = "" # description
export(int) var cost: int = 0
export(Rarity) var rarity: int = Rarity.COMMON
var type: int = 0 setget set_type
var equipment_type: int = 0

func _get_property_list() -> Array:
	var list = []
	list.append({
		"name": "type",
		"type": TYPE_INT,
		"hint": PROPERTY_HINT_ENUM,
		"hint_string": "Consumable,Treasure,Equipment,Tool"
	})
	match type:
		2: # Equipment
			list.append({
				"name": "equipment_type",
				"type": TYPE_INT,
				"hint": PROPERTY_HINT_ENUM,
				"hint_string": "Outfit,Weapon",
			})
	return list

func property_can_revert(property) -> bool:
	for p in get_property_list():
		if property == p.name:
			return true
	return false

func property_get_revert(property):
	match property:
		"type":
			return 0
		"equipment_type":
			return 0

func set_equipment_type(value):
	if equipment_type == value:
		return
	equipment_type = value
	property_list_changed_notify()
