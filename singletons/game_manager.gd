extends Node

var _levels: Dictionary = {
	1: LevelData.new(1, 2, 2),
	2: LevelData.new(2, 4, 2),
	3: LevelData.new(3, 3, 4),
	4: LevelData.new(4, 4, 6),
	5: LevelData.new(5, 6, 6),
	6: LevelData.new(6, 6, 7)
	}
	
func get_level(lvl: int) -> LevelData:
	return _levels[lvl]

func get_level_count() -> int:
	return _levels.keys().size()

func get_level_selection(lvl_num: int) -> SelectedLevelData:
	var ld: LevelData = _levels[lvl_num]
	var selected_level_imgs: Array[ItemImage] = []
	
	ImageManager.shuffle_images()
	
	for i in range(ld.get_target_pairs()):
		selected_level_imgs.append(ImageManager.get_image(i))
		selected_level_imgs.append(ImageManager.get_image(i))
	
	selected_level_imgs.shuffle()
	
	return SelectedLevelData.new(ld.get_target_pairs(), ld.get_num_cols(), selected_level_imgs)
	
