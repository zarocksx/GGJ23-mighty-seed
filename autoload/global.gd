extends Node

var playersGamepadBinding = [null,null,null,null];
var playerIndexToSet = 0

func setPlayerGamepadBinding(player: int, binding: int):
	playersGamepadBinding[player] = binding
	pass
func checkIfPLayerExist(event: InputEventJoypadButton):
	for playerId in 4:
		print("Checking " + str(playerId))
		if playersGamepadBinding[playerId] == event.device:
			return true
		#Si le joueur n'est pas encore enregistré
	playersGamepadBinding[playerIndexToSet] = event.device
	playerIndexToSet += 1
	return false
func getPlayersBinded():
	var bindedPlayers = []
	for player in range(playersGamepadBinding.size()):
		if playersGamepadBinding[player] != null :
			bindedPlayers.push(player)
	return bindedPlayers
