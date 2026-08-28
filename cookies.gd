extends Node

var CollectedCookies = 0

var config = ConfigFile.new()
const savePath = "user://save.cfg"

func saveCookies():
	config.set_value("player", "cookies", CollectedCookies)
	config.save(savePath)
	
func loadCookies():
	if FileAccess.file_exists(savePath):
		config.load(savePath)
		CollectedCookies = config.get_value("player", "cookies")
		

func _ready() -> void:
	loadCookies()
	
func _process(_delta: float) -> void:
	saveCookies()
