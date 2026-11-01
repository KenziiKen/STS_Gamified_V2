extends CanvasLayer
@onready var fade: ColorRect = $ColorRect
@onready var fade_player: AnimationPlayer = $AnimationPlayer

signal transition_finished

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	fade.visible = false
	fade_player.animation_finished.connect(fade_finished)
	pass # Replace with function body.

func fade_finished(fade_name):
	if fade_name == "fade_out":
		transition_finished.emit()
		fade_player.play("fade_in")
	elif fade_name == "fade_in":
		fade.visible = false

func transition():
	fade.visible = true
	fade_player.play("fade_in")
