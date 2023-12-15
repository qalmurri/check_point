extends TileMap

@onready var tile_map = $"."

func _input(event):
	if event is InputEventMouseButton:
		custom_data()

func custom_data():
	var pos = tile_map.local_to_map(tile_map.get_local_mouse_position())
	var tile_data = get_cell_tile_data(0, pos)
	if tile_data != null:
		var height_layer = tile_data.get_custom_data("HeightLayer")
		if height_layer != null:
			print("Height Layer:", height_layer)
		else: 
			print("Invalid or missing Height Layer.")
	else:
		print("No tile data found.")
	return 0
		
