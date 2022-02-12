extends Control

func host():
	var peer = NetworkedMultiplayerENet.new()
	peer.create_server(4242,2)
	get_tree().set_network_peer(peer)

func client():
	var peer = NetworkedMultiplayerENet.new()
	peer.create_client("127.0.0.1",4242)
	get_tree().set_network_peer(peer)

func sendMessage():
	var id = get_tree().get_network_unique_id()
	rpc("reciveMessage",id,"Test ")

sync func reciveMessage(id, message):
	$Panel/TextEdit.text += "\n" + message + str(id)

func _on_Send_pressed():
	sendMessage()


func _on_Client_pressed():
	client()


func _on_Host_pressed():
	host()
