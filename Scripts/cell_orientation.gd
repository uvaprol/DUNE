extends Node2D

signal plate_is_fixed

const CELL: int = 40

@export var ROW = 2
@export var COL = 2
@onready var viewport = get_viewport().get_visible_rect().size
@warning_ignore("integer_division")
@onready var VW = viewport.x 
@warning_ignore("integer_division")
@onready var VH = viewport.y

var is_fixed = false
var can_fixed = true

func update_position(pos):
	position.x = clamp(int(pos.x / CELL) * CELL, 0, VW - CELL * ROW)
	position.y = clamp(int(pos.y / CELL) * CELL, 0, VH - CELL * COL)

func  _ready() -> void:
	update_position(get_global_mouse_position())

func _input(event: InputEvent) -> void:
	if not is_fixed:
		if event is InputEventMouseMotion:
			update_position(event.position)
		if event is InputEventMouseButton:
			if can_fixed:
				if event.button_index == 1:
					print(event.button_index)
					is_fixed = true
					emit_signal("plate_is_fixed")
			else:
				print(can_fixed)

#func _on_plate_fixed() -> void:
	#is_fixed = true
	##emit_signal("plate_is_fixed")
	
