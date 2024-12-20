extends TextureButton

@export var level_num: int = 1

@onready var label: Label = $Label

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var lvl_data: LevelData = GameManager.get_level(level_num)
	label.text = "%dx%d" % [
		lvl_data.get_num_cols(),
		lvl_data.get_num_rows()
	]

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
