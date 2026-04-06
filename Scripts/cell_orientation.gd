extends Node2D

@onready var VW = get_viewport().size.x
@onready var VH = get_viewport().size.y
@export var CELL: int = 40

var is_fixed = false

func _input(event: InputEvent) -> void:
	if event is InputEventMouseMotion and not is_fixed:
		if VW > event.position.x and event.position.x >= 0:
			position.x = int(event.position.x / CELL) * CELL
		if VH > event.position.y and event.position.y >= 0:
			position.y = int(event.position.y / CELL) * CELL
