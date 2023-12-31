GDPC                �                                                                         P   res://.godot/exported/206107301/export-218a8f2b3041327d8a5756f3a245f83b-icon.res�       '      )R�݆<�G�q�R`Q�    P   res://.godot/exported/206107301/export-3070c538c03ee49b7677ff960a3f5195-main.scn       �      �E�~��l��;�dhl    d   res://.godot/exported/206107301/export-7503600555eeb5e583b5529f3bfd687a-player_character_info.scn   @      j      �3ߎb�]������    ,   res://.godot/global_script_class_cache.cfg  �             ��Р�8���8~$}P�       res://.godot/uid_cache.bin  �      e       %��K������0       res://icon.svg         �      C��=U���^Qu��U3       res://icon.svg.import           �       N���(�)0��y��F       res://main.tscn.remap   �      a       �gV��J=����ܒ        res://player_character_info.gd  �      e       ����?�S.���a�    (   res://player_character_info.tscn.remap  `      r       ��Җ�.���p�(�e��       res://project.binary0            ���/waח��MX�       res://server.gd �      �      C�(%<piE��-�1���       res://synchronizer_data.gd  �      ?       ��pm��]?��ز��    [remap]

importer="texture"
type="PlaceholderTexture2D"
uid="uid://dum21ffn1j5r4"
metadata={
"vram_texture": false
}
path="res://.godot/exported/206107301/export-218a8f2b3041327d8a5756f3a245f83b-icon.res"
 >�RSRC                    PlaceholderTexture2D            ��������                                                  resource_local_to_scene    resource_name    size    script        #   local://PlaceholderTexture2D_14w7g �          PlaceholderTexture2D       
      C   C      RSRC�p}Ҁ�h�RSRC                    PackedScene            ��������                                                  ..    resource_local_to_scene    resource_name 	   _bundled    script       Script    res://server.gd ��������      local://PackedScene_1b0qe          PackedScene          	         names "         Main    layout_mode    anchors_preset    anchor_right    anchor_bottom    grow_horizontal    grow_vertical    script    Control    Menu    offset_right    offset_bottom    VBoxContainer 
   PortInput    text    placeholder_text 	   LineEdit    MaxPlayersInput    Start    Button    MultiplayerSpawner    _spawnable_scenes    spawn_path    _on_start_pressed    pressed    	   variants                        �?                             B      9999       Port       16       Max Players       Start "      !   res://player_character_info.tscn                 node_count             nodes     R   ��������       ����                                                             	   ����         
                             ����                                      ����            	      
                    ����                                 ����                         conn_count             conns                                      node_paths              editable_instances              version             RSRC ����extends Node

func _ready():
	$MultiplayerSynchronizer.set_multiplayer_authority(str(name).to_int())
a�+�D�.RSRC                    PackedScene            ��������                                            
      MultiplayerSynchronizer 	   position    resource_local_to_scene    resource_name    properties/0/path    properties/0/spawn    properties/0/sync    properties/0/watch    script 	   _bundled       Script    res://player_character_info.gd ��������   Script    res://synchronizer_data.gd ��������   %   local://SceneReplicationConfig_g01hw �         local://PackedScene_r44sq [         SceneReplicationConfig                                                        PackedScene    	      	         names "         PlayerCharacter    script    Node    MultiplayerSynchronizer    replication_interval    replication_config    	   variants                 )   �������?                         node_count             nodes        ��������       ����                            ����                               conn_count              conns               node_paths              editable_instances              version             RSRC�7���extends Control

var multiplayer_peer = ENetMultiplayerPeer.new()

var port : int
var max_players : int

func _ready():
	var args = OS.get_cmdline_user_args()
	
	print(args)
	
	for arg in args:
		var key_value = arg.rsplit("=")
		match key_value[0]:
			"port":
				port = key_value[1].to_int()
			"max-players":
				max_players = key_value[1].to_int()
	
	multiplayer_peer.create_server(port, max_players)
	multiplayer.multiplayer_peer = multiplayer_peer
	multiplayer_peer.peer_connected.connect(func(id): add_player_character(id))
	print("Server started.")


func add_player_character(id=1):
	var character = preload("res://player_character_info.tscn").instantiate()
	character.name = str(id)
	add_child(character)
	print("Player joined, character added.")
�a��xSMw�extends MultiplayerSynchronizer


@export var position:Vector3
f[remap]

path="res://.godot/exported/206107301/export-3070c538c03ee49b7677ff960a3f5195-main.scn"
TW?�+�SE�H9Z0:U[remap]

path="res://.godot/exported/206107301/export-7503600555eeb5e583b5529f3bfd687a-player_character_info.scn"
����ݟ��o�list=Array[Dictionary]([])
Zi�e�<svg height="128" width="128" xmlns="http://www.w3.org/2000/svg"><rect x="2" y="2" width="124" height="124" rx="14" fill="#363d52" stroke="#212532" stroke-width="4"/><g transform="scale(.101) translate(122 122)"><g fill="#fff"><path d="M105 673v33q407 354 814 0v-33z"/><path fill="#478cbf" d="m105 673 152 14q12 1 15 14l4 67 132 10 8-61q2-11 15-15h162q13 4 15 15l8 61 132-10 4-67q3-13 15-14l152-14V427q30-39 56-81-35-59-83-108-43 20-82 47-40-37-88-64 7-51 8-102-59-28-123-42-26 43-46 89-49-7-98 0-20-46-46-89-64 14-123 42 1 51 8 102-48 27-88 64-39-27-82-47-48 49-83 108 26 42 56 81zm0 33v39c0 276 813 276 813 0v-39l-134 12-5 69q-2 10-14 13l-162 11q-12 0-16-11l-10-65H447l-10 65q-4 11-16 11l-162-11q-12-3-14-13l-5-69z"/><path d="M483 600c3 34 55 34 58 0v-86c-3-34-55-34-58 0z"/><circle cx="725" cy="526" r="90"/><circle cx="299" cy="526" r="90"/></g><g fill="#414042"><circle cx="307" cy="532" r="60"/><circle cx="717" cy="532" r="60"/></g></g></svg>
�1�O/)�:   �`ڝ{4w   res://icon.svg��h{l��s   res://main.tscnY�3��n*    res://player_character_info.tscn�RЖk����~MECFG      _custom_features         dedicated_server   application/config/name         firstrose_server   application/run/main_scene         res://main.tscn    application/config/features(   "         4.1    GL Compatibility       application/config/icon         res://icon.svg     editor/run/main_run_args0      &   --headless -- port=9999 max-players=16  #   rendering/renderer/rendering_method         gl_compatibility*   rendering/renderer/rendering_method.mobile         gl_compatibility����^