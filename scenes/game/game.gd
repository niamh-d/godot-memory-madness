extends Control

@onready var tc: GridContainer = $HB/MC/TC
@onready var scorer: Scorer = $Scorer
@onready var label_moves: Label = $HB/MC2/VB/HB/LabelMoves
@onready var label_pairs: Label = $HB/MC2/VB/HB2/LabelPairs


const MEMORY_TILE = preload("res://scenes/memory_tile/memory_tile.tscn")

func _ready() -> void:
	SignalManager.on_lvl_selected.connect(on_lvl_selected)

func _process(delta: float) -> void:
	label_moves.text = scorer.get_moves_made_str()
	label_pairs.text = scorer.get_num_pairs_made_str()
	
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
	
	scorer.clear_new_game(lvl_data.get_num_target_pairs())
	
func _on_exit_button_pressed() -> void:
	for t in tc.get_children():
		t.queue_free()
	SignalManager.on_game_exit_pressed.emit()
