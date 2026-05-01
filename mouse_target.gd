extends Area2D

var key = false

@export var drag_border: float = 10.0
@onready var window = get_viewport().get_visible_rect().size - Vector2(drag_border, drag_border)

func _ready() -> void:
	get_viewport().warp_mouse(position)

func _process(delta: float) -> void:
	print(get_viewport().get_mouse_position().x)
	if key:
		var direction: Vector2 = Vector2(0, 0)
		if get_viewport().get_mouse_position().x <= drag_border:
			direction.x = -1
		elif get_viewport().get_mouse_position().x >= window.x:
			direction.x = 1
		if get_viewport().get_mouse_position().y <= drag_border:
			direction.y = -1
		elif get_viewport().get_mouse_position().y >= window.y:
			direction.y = 1
		position += 500 * delta * direction
		
		
	elif Input.is_action_just_pressed("ui_accept"):
		key = true
