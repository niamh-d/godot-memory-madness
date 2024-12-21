extends CanvasLayer

@onready var main: Control = $Main
@onready var game: Control = $Game

func _ready() -> void:
	show_game(false)
	SignalManager.on_game_exit_pressed.connect(on_game_exit_pressed)
	SignalManager.on_lvl_selected.connect(on_lvl_selected)

func show_game(show: bool) -> void:
	game.visible = show
	main.visible = !show

func on_game_exit_pressed() -> void:
	show_game(false)

func on_lvl_selected(lvl_num: int) -> void:
	show_game(true)
