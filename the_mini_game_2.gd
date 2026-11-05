extends Control
@onready var wrong1: Area2D = $dock
@onready var right: Area2D = $dock2
@onready var wrong2: Area2D = $dock3
@onready var correct: AnimationPlayer = $AnimationPlayer
@onready var bg_music: AudioStreamPlayer2D = $AudioStreamPlayer2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	bg_music.play()
	Audio.get_node("/root/Audio").stream_paused = true
	correct.play("correct")
	await correct.animation_finished
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_dock_body_entered(body: Node2D) -> void:
	get_tree().change_scene_to_file("res://sayop.tscn")
	pass # Replace with function body.

func _on_dock_2_body_entered(body: Node2D) -> void:
	get_tree().change_scene_to_file("res://the_mini_game_3.tscn")
	pass # Replace with function body.

func _on_dock_3_body_entered(body: Node2D) -> void:
	get_tree().change_scene_to_file("res://sayop.tscn")
	pass # Replace with function body.

func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("end"):
		get_tree().quit()
