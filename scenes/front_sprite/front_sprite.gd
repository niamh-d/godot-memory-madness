extends TextureRect

func _ready() -> void:
	set_random_image()

func set_random_image() -> void:
	texture = ImageManager.get_random_item_image().get_texture()
