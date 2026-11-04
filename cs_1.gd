extends Node2D
@onready var fade: AnimationPlayer = $CanvasLayer/AnimationPlayer
@onready var text_speech: RichTextLabel = $CanvasLayer/Panel2/RichTextLabel
@onready var bg_music: AudioStreamPlayer2D = $AudioStreamPlayer2D
@onready var bg_noise: AudioStreamPlayer2D = $AudioStreamPlayer2D2
@onready var next_button: Button = $CanvasLayer/Button
@onready var next_button_2: Button = $CanvasLayer/Button2

var dialogue_lines: Array[String] = [
	". . .",
	"Alex: hapit na mohuman, inig uli tuon. . .",
	". . rest, research. . ",
	". . and then-"
]

var current_line_index: int = 0

func _ready() -> void:
	Audio.get_node("/root/Audio").stream_paused = true
	bg_music.play()
	bg_noise.play()
	
	text_speech.visible = false
	next_button.visible = false
	next_button_2.visible = false
	
	fade.play("new_animation")
	await fade.animation_finished
	text_speech.visible = true
	
	run_dialogue()
	
func run_dialogue() -> void:
	while current_line_index < dialogue_lines.size():
		text_speech.text = dialogue_lines[current_line_index]
		text_speech.visible_ratio = 0.0
		var txt = create_tween()
		txt.tween_property(text_speech, "visible_ratio", 2.0, 2.0)
		await txt.finished
		
		next_button.visible = true
		#await next_button.pressed
		
		current_line_index += 1
		await next_button.pressed
		next_button.visible = true
		
		next_button.visible = false
		
		if current_line_index == dialogue_lines.size():
			next_button_2.visible = true
			
	
func _on_button_2_pressed() -> void:
	fade.play("fade_out")
	await  fade.animation_finished
	get_tree().change_scene_to_file("res://mini_game.tscn")
	
func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("end"):
		get_tree().quit()
