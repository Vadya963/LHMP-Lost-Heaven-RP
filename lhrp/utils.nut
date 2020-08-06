function _playerSetPosition (playerid, x,y,z) {
	playerSetPosition(playerid, x.tofloat(),z.tofloat(),y.tofloat())
}

function _playerGetPosition (playerid) {
	local pos = playerGetPosition(playerid)
	return [pos[0],pos[2],pos[1]]
}

function _vehicleSpawn (id, x,y,z, rx,ry,rz) {
	vehicleSpawn(id.tointeger(), x.tofloat(),z.tofloat(),y.tofloat(), rx.tofloat(),rz.tofloat(),ry.tofloat())
}