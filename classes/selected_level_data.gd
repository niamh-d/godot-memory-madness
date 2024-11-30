class_name SelectedLevelData

var _selected_level_images: Array[ItemImage]
var _num_target_pairs: int
var _num_cols: int

func _init(pairs: int, cols: int, imgs: Array[ItemImage]) -> void:
	_num_target_pairs = pairs
	_num_cols = cols
	_selected_level_images = imgs

func get_selected_level_images() -> Array[ItemImage]:
	return _selected_level_images

func get_num_target_pairs() -> int:
	return _num_target_pairs

func get_num_cols() -> int:
	return _num_cols
