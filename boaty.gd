extends CharacterBody2D

var dragging = false
var off_set = Vector2(0,0)

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if dragging:
		position = get_global_mouse_position() - off_set

func _on_button_button_down() -> void:
	dragging = true
	off_set = get_global_mouse_position() - global_position

func _on_button_button_up() -> void:
	dragging = false


func _on_area_2d_body_entered(body: Node2D) -> void:
	pass # Replace with function body.
