extends Control
@onready var text_speech: RichTextLabel = $RichTextLabel
@onready var next_button: Button = $Button
@onready var animation: AnimationPlayer = $AnimationPlayer
@onready var bg_music: AudioStreamPlayer2D = $AudioStreamPlayer2D


var dialogue_lines: Array[String] = [
	"	Sir: Let's play a game!",
	"	Alex: ? ? ?",
	"	Sir: Does anyone know the game . .",
	"	Sir: . . longest line?",
	"	class: . . .",
	"	. . .",
	"	Sir: We will not play that game!",
	"	Sir: Instead, we will play . . .",
	"	Sir: A boat game!",
	"	Sir: In this game, you have to drag your boat-",
	"	Sir: To the correct dock!",
]

var current_line_index: int = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Audio.get_node("/root/Audio").stream_paused = true
	bg_music.play()
	animation.play("new_animation")
	await animation.animation_finished
	
	run_dialogue()

func run_dialogue() -> void:
	while current_line_index < dialogue_lines.size():
		text_speech.text = dialogue_lines[current_line_index]
		text_speech.visible_ratio = 0.0
		var txt = create_tween()
		txt.tween_property(text_speech, "visible_ratio", 2.0, 1.5)
		await txt.finished
		
		next_button.visible = true
		
		
		current_line_index += 1
		await next_button.pressed
		next_button.visible = true
		
		next_button.visible = false
		
		if dialogue_lines[current_line_index] == "	Sir: A boat game!" :
			animation.play("boat")
			await  animation.animation_finished
			pass
		
func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("end"):
		get_tree().quit()
