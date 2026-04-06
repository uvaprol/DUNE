extends Node2D

@onready var VW = get_viewport().size.x
@onready var VH = get_viewport().size.y
@export var CELL: int = 40

var is_fixed = false

func _process(_delta: float) -> void:
	if not is_fixed:
		var x = get_global_mouse_position().x
		var y = get_global_mouse_position().y
		if x < VW and x >= 0:
			position.x = int(x / CELL) * CELL
		if y < VH and y >= 0:
			position.y = int(y / CELL) * CELL
