extends Control

@onready var moves_label: Label = $NinePatchRect/MC/VB/MovesLabel


func _ready() -> void:
	SignalManager.on_game_over.connect(on_game_over)
	SignalManager.on_game_exit_pressed.connect(on_game_exit_pressed)

func on_game_over(moves: int) -> void:
	moves_label.text = "You took %d moves" % moves
	show()


func on_game_exit_pressed() -> void:
	hide()
