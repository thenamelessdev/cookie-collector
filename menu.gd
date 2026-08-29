extends Node2D

@onready var button: Button = $Button

func _ready() -> void:
	button.pressed.connect(_on_btn_press)
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	
func _on_btn_press():
	get_tree().change_scene_to_file("res://main.tscn")
