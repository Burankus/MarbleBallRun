extends Node3D

@onready var click = $Click

func _on_play_pressed():
	click.play()
	await  click.finished
	SceneTrans.change_scene("res://scenes/map/levels/level_1_plain.tscn")


func _on_settings_pressed():
	click.play()
	await  click.finished
	pass # Replace with function body.


func _on_quit_game_pressed():
	click.play()
	await  click.finished
	get_tree().quit()
