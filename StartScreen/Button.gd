extends Button

func press():
	print("helloworld")
	get_tree().change_scene_to_file("res://Cow-Manager/World/world.tscn")
