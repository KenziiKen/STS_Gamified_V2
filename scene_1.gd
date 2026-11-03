extends Control
@onready var fade: AnimationPlayer = $AnimationPlayer
#@onready var text_: RichTextLabel = $RichTextLabel
@onready var text_: RichTextLabel = $CanvasLayer/RichTextLabel

var visible_text = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	text_.visible = false
	fade.play("new_animation")
	await fade.animation_finished
	text_.visible = true
	# Start with hidden text
	text_.visible_ratio = 0.0
	
	# Animate the text to fully appear over 2 seconds (change 2.0 to speed it up or slow it down)
	var txt = create_tween()
	txt.tween_property(text_, "visible_ratio", 1.0, 2.0)
	
	await txt.finished
	text_.visible_ratio = 0.0
	text_.text = "is this working?"
	txt = create_tween()
	txt.tween_property(text_, "visible_ratio", 1.0, 2.0)
	
	
	pass # Replace with function body
