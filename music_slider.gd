extends HSlider
@export var music : String
var music_index : int

func _ready() -> void:
	music_index = AudioServer.get_bus_index(music)
	value = db_to_linear(AudioServer.get_bus_volume_db(music_index))
	
	value_changed.connect(volume_change)
	
func volume_change(value : float) -> void:
	AudioServer.set_bus_volume_db(music_index, linear_to_db(value))
	
