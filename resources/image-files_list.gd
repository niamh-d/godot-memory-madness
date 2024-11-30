extends Resource

class_name ImageFilesList

@export var file_paths: Array[String]

func add_filepath(fn: String) -> void:
	if !'.import' in fn:
		file_paths.append(fn)

func get_file_paths() -> Array[String]:
	return file_paths
