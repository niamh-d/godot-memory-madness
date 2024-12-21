extends TextureButton

class_name MemoryTile

@onready var frame_image: TextureRect = $FrameImage
@onready var item_image: TextureRect = $ItemImage

var _item_name: String
var _can_select_me: bool = true

func _ready() -> void:
	SignalManager.on_selection_enabled.connect(on_selection_enabled)
	SignalManager.on_selection_disabled.connect(on_selection_disabled)
	
func reveal(r: bool) -> void:
	frame_image.visible = r
	item_image.visible = r

func setup(image: ItemImage, frame: Texture2D) -> void:
	frame_image.texture = frame
	item_image.texture = image.get_texture()
	_item_name = image.get_item_name()
	reveal(false)

func on_selection_enabled() -> void:
	_can_select_me = true

func on_selection_disabled() -> void:
	_can_select_me = false

func _on_pressed() -> void:
	if _can_select_me && !frame_image.visible:
		SignalManager.on_tile_selected.emit(self)
