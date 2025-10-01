extends Node3D

@onready var playerSpawn = $PlayerSpawnPos
@onready var game_clock = $GameTimer
@export var Player = preload("res://scenes/player/player.tscn")
@export var Coins = preload("res://scenes/objects/coin.tscn")
@onready var click = $Click

@onready var menu = $Control

var player
var coins_collected: int

@onready var coins1 = $CoinsSpawn/CoinObj
@onready var coins2 = $CoinsSpawn/CoinObj2
@onready var coins3 = $CoinsSpawn/CoinObj3

func _ready():
	game_clock.start()
	$BGM.play()
	coins_collected = 0
	_spawn_player()
	$Goal.connect("reach_goal", reach_goal)
	$Hazard/moving_spike_wide.connect("touch_spike", spike_death)
	$Hazard/moving_spike_wide2.connect("touch_spike", spike_death)
	coins1.connect("collected_coin", _collect_coin)
	coins2.connect("collected_coin", _collect_coin)
	coins3.connect("collected_coin", _collect_coin)

func _spawn_player():
	player = Player.instantiate()
	add_child(player)
	player.global_position = playerSpawn.global_position

func _on_static_body_3d_body_entered(_body):
	$Hit.play()
	player.queue_free()
	_spawn_player()

func spike_death():
	$Hit.play()
	player.queue_free()
	_spawn_player()

func reach_goal():
	menu.visible = true
	Input.mouse_mode = Input.MOUSE_MODE_VISIBLE
	
	var time_left: int = game_clock.time_left
	$Control/Label2.text = "TIME LEFT: " + str(time_left)
	$Control/Label3.text = "COINS COLLECTED: " + str(coins_collected)

func _on_game_timer_timeout():
	print("Game Over")

func _collect_coin():
	$CoinSound.play()
	coins_collected += 1
	print(coins_collected)


func _on_next_pressed():
	click.play()
	await  click.finished
	SceneTrans.change_scene("res://scenes/map/levels/level_2_snow.tscn")


func _on_button_pressed():
	click.play()
	await  click.finished
	SceneTrans.change_scene("res://menus/main_menu.tscn")


func _on_quit_pressed():
	click.play()
	await  click.finished
	get_tree().quit()
