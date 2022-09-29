extends VBoxContainer

var multiplayer_peer = ENetMultiplayerPeer.new()

func _on_join_pressed():
	multiplayer_peer.create_client(
		$Menu/AddressInput.text,
		$Menu/PortInput.text.to_int(),
	)
	multiplayer.multiplayer_peer = multiplayer_peer
	$Menu.visible = false


func _on_list_players_pressed():
	print(multiplayer.get_peers())


func _on_kick_pressed():
	kick_player.rpc_id(1,$PeerId.text.to_int(),$AdminPassword.text)

@rpc	
func kick_player(peer_id, password):
	pass
