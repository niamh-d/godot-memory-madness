extends Control

func _ready() -> void:
	SignalManager.on_lvl_selected.connect(on_lvl_selected)

func on_lvl_selected(lvl_num: int) -> void:
	print(lvl_num)


func _on_exit_button_pressed() -> void:
	SignalManager.on_game_exit_pressed.emit()
