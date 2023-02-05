extends Node

var playersGamepadBinding = [null,null,null,null];

func setPlayerGamepadBinding(player: int, binding: int):
	playersGamepadBinding[player] = binding
	pass

func getPlayersBinded():
	var bindedPlayers = []
	for player in range(playersGamepadBinding.size()):
		if playersGamepadBinding[player] != null :
			bindedPlayers.push(player)
	return bindedPlayers
