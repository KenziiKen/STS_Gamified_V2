extends CanvasLayer
@onready var color_rect: ColorRect = $ColorRect


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	color_rect.color.a = 0.0

func fade_(target_alpha: float, duration: float = 1.0):
	var tween = create_tween()
	tween.tween_property(color_rect, "color:a", target_alpha, duration)
	return tween

func transition_to_scene(target_scene_path: String) -> void:
	var tween = fade_(1.0, 1.5)
	await tween.finished
	get_tree().change_scene_to_file(target_scene_path)
