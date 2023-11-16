extends Node2D

func _ready():
	save_data()
	
func data_game():
	var data  = {
		"score":1212312321,
		"username":"qalmurri",
		"position":Vector3(0,0,0)
	}
	return data
	
func save_data():
	var save = FileAccess.open("user://savegame.save", FileAccess.WRITE)
	var json_string = JSON.stringify(data_game())
	
	save.store_line(json_string)
