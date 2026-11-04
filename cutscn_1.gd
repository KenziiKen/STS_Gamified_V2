extends Node2D
@onready var group: CanvasLayer = $CanvasLayer
@onready var fade_: AnimationPlayer = $CanvasLayer2/AnimationPlayer

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	group.visible = false
	fade_.play("new_animation")
	await fade_.animation_finished
	group.visible = true
	pass
