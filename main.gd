extends Node2D

@export var daftar_level :Array[PackedScene] = []
@onready var level
var current_level 
var current_level_index = 0
var level_sebelumnya


#masukkan level pertama
func _ready() -> void:
	global.main_node = self
	level = daftar_level[0].instantiate()
	$levelContainer.add_child(level)
	$player.position = level.get_node("startPosition").global_position


#menghapus node level
func hapus_level():
	level.queue_free()
	print('hapus')

#reset posisi player
func reset_player():
	$player.coin_earn = 0
	var start_position = level.get_node('startPosition')
	$player.position = start_position.global_position

#load level baru
func load_level(index : int):
	reset_player()
	await get_tree().process_frame
	hapus_level()
	level = daftar_level[index].instantiate()
	$levelContainer.add_child(level)
	current_level_index = index
	print(current_level_index)

#next level
func next_level():
	if current_level_index + 1 < daftar_level.size(): 
		call_deferred("load_level", current_level_index+1)
	else:
		print("semua level sudah selesai")
		get_tree().change_scene_to_file("res://home_scene.tscn")


#restart
func restart_level() -> void:
	load_level(current_level_index)



func result_level () -> void :
	$levelResult.load_result_level($player.coin_earn, 0.5)
