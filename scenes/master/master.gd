extends CanvasLayer

@onready var main: Control = $Main
@onready var game: Control = $Game
@onready var sound: AudioStreamPlayer = $Sound

func _ready() -> void:
	on_game_exit_pressed()
	SignalManager.on_game_exit_pressed.connect(on_game_exit_pressed)
	SignalManager.on_lvl_selected.connect(on_lvl_selected)

func show_game(show: bool) -> void:
	game.visible = show
	main.visible = !show

func on_game_exit_pressed() -> void:
	show_game(false)
	SoundManager.play_sound(sound, SoundManager.SOUND_MAIN_MENU)

func on_lvl_selected(lvl_num: int) -> void:
	show_game(true)
	SoundManager.play_sound(sound, SoundManager.SOUND_IN_GAME)
