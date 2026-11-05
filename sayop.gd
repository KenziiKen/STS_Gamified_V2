extends Control

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Audio.get_node("/root/Audio").stream_paused = true

func transition_to_scene(target_scene_path: String) -> void:
	get_tree().change_scene_to_file(target_scene_path)

func _on_button_pressed() -> void:
	get_tree().change_scene_to_file("res://the_mini_game.tscn")
	pass # Replace with function body.
