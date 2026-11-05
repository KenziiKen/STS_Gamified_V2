extends Control
@onready var bg_music: AudioStreamPlayer2D = $AudioStreamPlayer2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	bg_music.play()
	Audio.get_node("/root/Audio").stream_paused = true
	pass # Replace with function body.


func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("end"):
		get_tree().quit()

func _on_button_pressed() -> void:
	get_tree().change_scene_to_file("res://main_menu.tscn")
	#get_tree().quit()
	pass # Replace with function body.
