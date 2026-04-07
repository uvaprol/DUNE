extends StaticBody2D

@export var HP = 100
@export var CELL_SIZE = 4
var bonus_plate = []
var plate_under = []

func check_under_plate() -> bool:
	return true

func _ready() -> void:
	$"..".plate_is_fixed.connect(_on_plate_is_fixed)
	
func _on_area_2d_area_entered(area: Area2D) -> void:
	if area.name.substr(0, len("concrete_plate")) == "concrete_plate":
		bonus_plate.append(area)

func _on_area_2d_area_exited(area: Area2D) -> void:
	if area.name.substr(0, len("concrete_plate")) == "concrete_plate":
		bonus_plate.erase(area)

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body != self:
		print(body)
		$"..".can_fixed = false
		$Sprite2D.self_modulate = Color.html("#ff6f6f")
		plate_under.append(body)
	
func _on_area_2d_body_exited(body: Node2D) -> void:
	if body != self:
		plate_under.erase(body)
		$"..".can_fixed = plate_under.is_empty()
		$Sprite2D.self_modulate = Color.html("#6fff6f") if plate_under.is_empty() else Color.html("#ff6f6f")

func _on_plate_is_fixed() -> void:
	$Sprite2D.self_modulate = Color.html("#fff")
	print('bonus_plate count:')
	print(len(bonus_plate))
	for p in bonus_plate:
		p.queue_free()
#TODO исправить регистрацию бонусных панелей
