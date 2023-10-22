GDPC                �                                                                         T   res://.godot/exported/206107301/export-4b86ca6c651e25ffd02553d85145d19f-Server.scn  �      g      ���G��	q�d���    ,   res://.godot/global_script_class_cache.cfg  �             ��Р�8���8~$}P�       res://.godot/uid_cache.bin  �      !       ��a��F>�5�]~�o       res://PlayerData.json           (       �3sm��I�I�Ų��       res://Server.gd �      C      [FZ1Խ�c���zg�	1       res://Server.tscn.remap `      c       '2ĕ	L (\�~h��       res://ServerData.gd 0       f      �R�o1D�&W�w��       res://project.binary 	            )Z%�M<
���(�    ���=��S�{
	"Player Levels": {
		"Test": 36
	}
}
V��<�[�extends Node

# This is just an example for communicating with this server. Later,
# levels will obviously be stored on a per-player basis in a more complex way.
var player_data

func _ready():
	var file = FileAccess.open("res://PlayerData.json", FileAccess.READ)
	var file_data = file.get_as_text()
	player_data = JSON.parse_string(file_data)
	file.close()
NI�.:��e�I# https://youtu.be/lnFN6YabFKg

extends Node

var network = ENetMultiplayerPeer.new()
var gateway = SceneMultiplayer.new()
var port = 1707
var max_players = 40


func _ready():
	start_server()

func start_server():
	network.create_server(port, max_players)
	# get_tree().set_multiplayer(gateway, self.get_path())
	multiplayer.set_multiplayer_peer(network)
	print("Server started")
	
	network.connect("peer_connected", _peer_connected)
	network.connect("peer_disconnected", _peer_disconnected)

func _peer_connected(player_id):
	print("User " + str(player_id) + " Connected")

func _peer_disconnected(player_id):
	print("User " + str(player_id) + " Disconnected")

@rpc("any_peer", "reliable")
func fetch_level(level_name, requester):
	var player_id = multiplayer.get_remote_sender_id()
	var level = ServerData.player_data["Player Levels"][level_name]
	print("Sending " + str(level) + " to player " + str(player_id))
	return_level(level, requester, player_id)

@rpc("authority", "reliable")
func return_level(level, requester, player_id):
	rpc_id(player_id, "return_level", level, requester)
V�k����Z�RSRC                    PackedScene            ��������                                                  resource_local_to_scene    resource_name 	   _bundled    script       Script    res://Server.gd ��������      local://PackedScene_hm5cy          PackedScene          	         names "         Main    script    Node    	   variants                       node_count             nodes     	   ��������       ����                    conn_count              conns               node_paths              editable_instances              version             RSRC8.?�X��[remap]

path="res://.godot/exported/206107301/export-4b86ca6c651e25ffd02553d85145d19f-Server.scn"
;@m������{�list=Array[Dictionary]([])
��U�   X�ďU�U   res://Server.tscn>௱�tBjK*p�zNECFG      _custom_features         dedicated_server   application/config/name         firstrose_server   application/run/main_scene         res://Server.tscn      application/config/features(   "         4.1    GL Compatibility       autoload/ServerData         *res://ServerData.gd   editor/run/main_run_args0      &   --headless -- port=9999 max-players=16  #   rendering/renderer/rendering_method         gl_compatibility*   rendering/renderer/rendering_method.mobile         gl_compatibility��ZE