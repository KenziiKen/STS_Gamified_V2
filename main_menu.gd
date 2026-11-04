extends Control
@onready var fade: CanvasLayer = $Fade

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

func _on_start_pressed() -> void:
	#fade.transition_to_scene("res://scene_1.tscn")
	#fade.transition_to_scene("res://cutscn_1.tscn")
	#fade.transition_to_scene("res://1_st_scene.tscn")
	#get_tree().change_scene_to_file("res://chapter.tscn")
	fade.transition_to_scene("res://chapter.tscn")
	#print("Not yet!")
	pass
	
func _on_chapts_pressed() -> void:
	#fade.transition_to_scene("res://chapter.tscn")
	get_tree().change_scene_to_file("res://chapter.tscn")

func _on_credits_pressed() -> void:
	get_tree().change_scene_to_file("res://credits.tscn")

func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("end"):
		get_tree().quit()
