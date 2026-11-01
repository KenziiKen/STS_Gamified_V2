extends Node2D
@onready var alex: Sprite2D = $Sprite2D
@export var speed: float = 350.0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(_delta: float) -> void:
	var direction := Input.get_vector("left", "right", "up", "down")
	#var direction2 := Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	
	position += direction * speed * _delta
	#move_and_slide()
	if direction != Vector2.ZERO:
		if direction.x > 0:
			alex.frame = 1  # Right moves to frame 1
		elif direction.y < 0:
			alex.frame = 2  # Up moves to frame 2
		elif direction.x < 0:
			alex.frame = 3  # Left moves to frame 3
		elif direction.y > 0:
			alex.frame = 0  # Down moves to frame 0
