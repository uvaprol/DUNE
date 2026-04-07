extends Area2D

func _on_body_entered(body: Node2D) -> void:
	print(body)


func _on_child_entered_tree(node: Node) -> void:
	print(node)
