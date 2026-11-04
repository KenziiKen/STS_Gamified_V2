extends CanvasLayer
@onready var background: ColorRect = $ColorRect
@onready var animation: AnimationPlayer = $AnimationPlayer
@onready var alex: CharacterBody2D = $Alex


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	
	alex.visible = false
	animation.play("fade_in")
	await animation.animation_finished
	if alex:
		alex.visible = true
		alex.velocity = Vector2.ZERO # Stops any lingering movement
	animation.play("alex_slide")
	await animation.animation_finished
	if alex:
		alex.set_physics_process(true)
	pass # Replace with function body.

func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("end"):
		get_tree().quit()
