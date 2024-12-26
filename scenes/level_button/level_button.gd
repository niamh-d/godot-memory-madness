extends TextureButton

@export var level_num: int = 1

@onready var label: Label = $Label
@onready var sound: AudioStreamPlayer = $Sound

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var lvl_data: LevelData = GameManager.get_level(level_num)
	label.text = "%dx%d" % [
		lvl_data.get_num_cols(),
		lvl_data.get_num_rows()
	]

func _on_pressed() -> void:
	SoundManager.play_button_click(sound)
	SignalManager.on_lvl_selected.emit(level_num)
