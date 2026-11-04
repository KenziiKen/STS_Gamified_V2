extends Control
@onready var fade: CanvasLayer = $Fade

func _on_start_pressed() -> void:
	get_tree().change_scene_to_file("res://chapter.tscn")

func _on_chapts_pressed() -> void:
	#fade.transition_to_scene("res://chapter.tscn")
	get_tree().change_scene_to_file("res://chapter.tscn")

func _on_credits_pressed() -> void:
	get_tree().change_scene_to_file("res://credits.tscn")

func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("end"):
		get_tree().quit()
