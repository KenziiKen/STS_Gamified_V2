extends Control
@onready var fade: CanvasLayer = $Fade

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

func _on_back_pressed() -> void:
	#fade.transition_to_scene("res://main_menu.tscn")
	get_tree().change_scene_to_file("res://main_menu.tscn")
	pass # Replace with function body.
