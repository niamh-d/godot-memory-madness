extends Control

@onready var tc: GridContainer = $HB/MC/TC

const MEMORY_TILE = preload("res://scenes/memory_tile/memory_tile.tscn")

func _ready() -> void:
	SignalManager.on_lvl_selected.connect(on_lvl_selected)
	
func add_memory_tile(img: ItemImage, frame: Texture2D) -> void:
		var mt: MemoryTile = MEMORY_TILE.instantiate()
		tc.add_child(mt)	
		mt.setup(img, frame)	

func on_lvl_selected(lvl_num: int) -> void:
	var lvl_data: SelectedLevelData = GameManager.get_level_selection(lvl_num)
	var frame: Texture2D = ImageManager.get_random_frame_image()
	
	tc.columns = lvl_data.get_num_cols()
	
	for im in lvl_data.get_selected_level_images():
		add_memory_tile(im, frame)
	
func _on_exit_button_pressed() -> void:
	SignalManager.on_game_exit_pressed.emit()
