extends Control
#@onready var fade: CanvasLayer = $Fade
@onready var fade: CanvasLayer = $Fade

func _on_back_pressed() -> void:
	get_tree().change_scene_to_file("res://main_menu.tscn")

func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("end"):
		get_tree().quit()

func _on_button_1_pressed() -> void:
	fade.transition_to_scene("res://1_st_scene.tscn")
	pass # Replace with function body.
