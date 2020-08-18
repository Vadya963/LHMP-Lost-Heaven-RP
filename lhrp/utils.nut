//bugs
//вылетает если удалить авто с игроком или без игрока
//иногда вылетает при перезапуске ресурсов
//иногда при перезапуске ресурсов перестаёт работать счетчик фпс
//при повреждении авто после создания, передние колеса начинают крутиться, со временем проходит
//с каждым удалением авто, скорость езды возрастает

//лимит
//можно создать 100 тачек, больше не создаётся
//в чате лимит 240 символов

local vehicle_variant = {
	//name 0, variant 1, fuel 2
	[0] = ["Bolt Ace Tudor",[0,1,2,3,4],50],
	[1] = ["Bolt Ace Touring",[5,6,7,8,9],50],
	[2] = ["Bolt Ace Runabout",[10,11,12,13,14],50],
	[3] = ["Bolt Ace Pickup",[15,16,17,18,19],50],
	[4] = ["Bolt Ace Fordor",[20,21,22,23,24],50],
	[5] = ["Bolt Ace Coupe",[25,26,27,28,29],50],
	[6] = ["Bolt Model B Tudor",[30,31,32,33],50],//54,55,56,57 copy car
	[7] = ["Bolt Model B Roadster",[34,35,36,37],50],
	[8] = ["Bolt Model B Pickup",[38,39,40,41],50],
	[9] = ["Bolt Model B Fordor",[42,43,44,45],50],
	[10] = ["Bolt Model B Delivery",[46,47,48,49],50],
	[11] = ["Bolt Model B Coupe",[50,51,52,53],50],
	[12] = ["Bolt V8 Coupe",[58,59,60,61],45],
	[13] = ["Bolt V8 Fordor",[62,63,64,65],45],
	[14] = ["Bolt V8 Roadster",[66,67,68,69],45],
	[15] = ["Bolt V8 Touring",[70,71,72,73],45],
	[16] = ["Bolt V8 Tudor",[74,75,76,77],45],
	[17] = ["Brubaker",[78],60],//race
	[18] = ["Bruno Speedster 851",[79,80,81],50],
	[19] = ["Caesar 8C 2300",[82],50],//race
	[20] = ["Caesar 8C Mostro",[83,84],50],
	[21] = ["Celeste Marque 500",[85,86],40],
	[22] = ["Corrozella C-Otto",[87,88],50],
	[23] = ["Crusader Chromim Fordor",[89,90],70],
	[24] = ["Crusader Chromim Tudor",[91,92],70],
	[25] = ["Falconer",[93,94,95,96],60],//95 ganster, 96 taxi
	[26] = ["Guardian Terraplane Coupe",[97,98,99],50],
	[27] = ["Guardian Terraplane Fordor",[100,101,102],50],
	[28] = ["Guardian Terraplane Tudor",[103,104,105],50],
	[29] = ["Lassister Fordor",[106],80],
	[30] = ["Lassister Phaeton",[107],80],
	[31] = ["Lassister Roadster",[108],80],
	[32] = ["Lassister Appolyon",[109],80],
	[33] = ["Lassister Charon",[110],80],
	[34] = ["Lassister Police",[111],80],
	[35] = ["Schubert Extra Six Fordor",[112,113,114,115],63.6],//115 police
	[36] = ["Schubert Extra Six Tudor",[116,117,118,119],63.6],//119 police
	[37] = ["Schubert Six",[120,121,122,123],50],//123 police
	[38] = ["Silver Fletcher",[124],50],
	[39] = ["Thor 810 Cabriolet",[125,126],60],
	[40] = ["Thor 810 Phaeton",[127,128],60],
	[41] = ["Thor 812 Sedan",[129,130],60],
	[42] = ["Trautenberg Model J",[131],60],
	[43] = ["Trautenberg Racer 4WD",[132],50],//race
	[44] = ["Ulver Airstream Fordor",[133,134],50],
	[45] = ["Ulver Airstream Tudor",[135,136],50],
	[46] = ["Wright Coupe",[137,138,139,140],60],//140 ganster
	[47] = ["Wright Fordor",[141,142,143],60],
	[48] = ["Bolt Ambulance",[144],50],
	[49] = ["Bolt Firetruck",[145],70],
	[50] = ["Bolt Hearse",[146],50],
	[51] = ["Bolt Truck",[147,148,/*149,*/150],70],//149 no sound car
	[52] = ["Manta",[151,169],60],//169 taxi
	[53] = ["Bolt-Thrower",[152],70],
	[54] = ["HotRod",[153],40],//taxi
	[55] = ["Black Dragon",[154],50],//taxi
	[56] = ["Mutagen",[155],60],
	[57] = ["Flamer",[156],50],
	[58] = ["Masseur",[157],50],
	[59] = ["Masseur Taxi",[158],50],//taxi
	[60] = ["Demoniac",[159],50],
	[61] = ["Crazy Horse",[160],50],
	[62] = ["Bob Mylan",[161],63.6],//taxi
	[63] = ["Disorder",[162],50],
	[64] = ["Speedee",[163],60],//taxi
	[65] = ["Luciferion",[164],60],//taxi
	[66] = ["Black Metal",[165],80],
	[67] = ["Hillbilly 5.1",[166],70],
	[68] = ["Flower Power",[167],50],
	[69] = ["Flame Spear",[168],50],
}

function random(min=0, max=RAND_MAX)
{
	srand(time() * rand())
	return (rand() % ((max + 1) - min)) + min//функция для получения рандомных чисел
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

function table_find_value (table, value) {
	foreach (k, v in table) {
		if(v == value)
		{
			return true
		}
	}

	return false
}

function getRealData () {
	local time = ""

	if(date().day < 10)
	{
		time = time+"0"+date().day
	}
	else
	{
		time = time+date().day
	}

	if(date().month+1 < 10)
	{
		time = time+".0"+(date().month+1)
	}
	else
	{
		time = time+(date().month+1)
	}

	time = time+"."+date().year

	return time
}

function getRealTime () {
	local time = ""

	if(date().hour < 10)
	{
		time = time+"0"+date().hour
	}
	else
	{
		time = time+date().hour
	}

	if(date().min < 10)
	{
		time = time+":0"+date().min
	}
	else
	{
		time = time+":"+date().min
	}

	if(date().sec < 10)
	{
		time = time+":0"+date().sec
	}
	else
	{
		time = time+":"+date().sec
	}

	return time
}

function RGBToHex(color, alpha=0)
{
	// Alpha check
	if (alpha)
	{
		return format("#%.2X%.2X%.2X%.2X", color[0], color[1], color[2], alpha)
	}
	else
	{
		return format("#%.2X%.2X%.2X", color[0], color[1], color[2])
	}
}

function _playerSetPosition (playerid, x,y,z) {
	playerSetPosition(playerid, x.tofloat(),z.tofloat(),y.tofloat())
}

function _playerGetPosition (playerid) {
	local pos = playerGetPosition(playerid)
	return [pos[0],pos[2],pos[1]]
}

function _vehicleSpawn (id, variant, x,y,z, rx,ry,rz) {
	local vehicle = -1
	local id = id.tointeger()
	local variant = variant.tointeger()

	if(table_find_key(vehicle_variant[id][1], variant))
	{
		vehicle = vehicleSpawn(vehicle_variant[id][1][variant], x.tofloat(),z.tofloat(),y.tofloat(), rx.tofloat(),rz.tofloat(),ry.tofloat())
	}
	else
	{
		vehicle = vehicleSpawn(vehicle_variant[id][1][0], x.tofloat(),z.tofloat(),y.tofloat(), rx.tofloat(),rz.tofloat(),ry.tofloat())
	}

	return vehicle
}

function _playerAddConsoleText (playerid, color, text) {
	playerAddConsoleText(playerid, color.slice(1,color.len()), text)
}