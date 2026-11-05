extends Control

@onready var label = $Label
@onready var timer = $Timer

func _ready():
	timer.wait_time = 1 * 60
	timer.timeout.connect(_on_timer_timeout)
	timer.start()

func _on_timer_timeout():
	get_tree().change_scene_to_file("res://game_over.tscn")

func time_left_to_live():
	var time_left = timer.time_left
	var minute = floor(time_left / 60)
	var second = int(time_left) % 60
	return [minute, second]
	

func _process(delta):
	label.text = "%02d:%02d" % time_left_to_live()
