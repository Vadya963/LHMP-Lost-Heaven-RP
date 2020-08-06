function random(min=0, max=RAND_MAX)
{
	srand(time() * rand())
	return (rand() % ((max + 1) - min)) + min//функция для получения рандомных чисел
}

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

function table_find_key (table, key) {
	foreach (k, v in table) {
		if(k == key)
		{
			return true
		}
	}

	return false
}