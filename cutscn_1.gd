extends Node2D
@onready var fade: CanvasLayer = $CanvasLayer/Fade


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	await fade.fade_(0.0, 1.5).finished
	pass
