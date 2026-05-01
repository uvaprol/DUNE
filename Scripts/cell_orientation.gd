extends Node2D

signal plate_is_fixed

const CELL: int = 40

@export var ROW = 2
@export var COL = 2
@onready var viewport = get_viewport().get_visible_rect().size
@onready var VW = viewport.x 
@onready var VH = viewport.y

var is_fixed = false
var can_fixed = true

func update_position(pos):
	#TODO ограничение относительно положения камеры
	position.x = clamp(int(pos.x / CELL) * CELL, 0, int(VW / CELL) * CELL - CELL * ROW)
	position.y = clamp(int(pos.y / CELL) * CELL, 0, int(VH / CELL) * CELL - CELL * COL)

func  _ready() -> void:
	update_position(get_global_mouse_position())


func _input(event: InputEvent) -> void:
	if not is_fixed:
		if event is InputEventMouseMotion:
			update_position(event.position)
		if event is InputEventMouseButton:
			if can_fixed:
				if event.button_index == 1 and event.pressed:
					is_fixed = true
					print(position.y)
					emit_signal("plate_is_fixed")
			else:
				print(can_fixed)

#func _on_plate_fixed() -> void:
	#is_fixed = true
	##emit_signal("plate_is_fixed")
	
