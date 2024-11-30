class_name LevelData

var _level_number: int
var _num_rows: int
var _num_cols: int

func _init(lvl_num: int, rows: int, cols: int) -> void:
	_level_number = lvl_num
	_num_rows = rows
	_num_cols = cols

func get_num_rows() -> int:
	return _num_rows

func get_num_cols() -> int:
	return _num_cols

func get_level_number() -> int:
	return _level_number

func get_target_pairs() -> int:
	return int((_num_rows * _num_cols) / 2)

func get_num_tiles() -> int:
	return _num_rows * _num_cols
