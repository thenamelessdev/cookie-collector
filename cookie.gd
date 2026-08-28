extends Node3D

@onready var area_3d: Area3D = $Area3D

func _ready() -> void:
	area_3d.body_entered.connect(_on_body_enter)
	
	
func _on_body_enter(body: Node3D):
	if body.is_in_group("Player"):
		Cookies.CollectedCookies += 1
		queue_free()
