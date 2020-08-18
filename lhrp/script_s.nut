dofile("gamemodes/lhrp/utils.nut", true)

//----цвета----
local color_mes = {
	color_tips = [168,228,160],//бабушкины яблоки
	yellow = [255,255,0],//желтый
	red = [255,0,0],//красный
	red_try = [200,0,0],//красный
	blue = [0,150,255],//синий
	white = [255,255,255],//белый
	green = [0,255,0],//зеленый
	green_try = [0,200,0],//зеленый
	turquoise = [0,255,255],//бирюзовый
	orange = [255,100,0],//оранжевый
	orange_do = [255,150,0],//оранжевый do
	pink = [255,100,255],//розовый
	lyme = [130,255,0],//лайм админский цвет
	svetlo_zolotoy = [255,255,130],//светло-золотой
	crimson = [220,20,60],//малиновый
	purple = [175,0,255],//фиолетовый
	gray = [150,150,150],//серый
	green_rc = [115,180,97],//темно зеленый
}

function sqlite3(text)
{
	local table = {}
	local result = sqlite3_query("gamemodes/lhrp/lhmp-rp.db", text)

	if(text.find("U") == 0 || text.find("I") == 0 || text.find("D") == 0)
	{
		sqlite3_step(result)
	}
	else if(text.find("S") == 0)
	{	
		while(sqlite3_step(result) == SQLITE_ROW) 
		{
			for(local i = 0; i < sqlite3_column_count(result); i++) 
			{
				if (!table_find_key(table,sqlite3_column_name(result, i)))
				{
					table[sqlite3_column_name(result, i)] <- []
				}

				table[sqlite3_column_name(result, i)].push(sqlite3_column_text(result, i))
			}
		}
	}

	sqlite3_finalize(result)

	return table
}

local spawn_pos = [-575.101,1622.8,-15.6957]//--стартовая позиция

local car = array(serverGetMaxPlayers(), false)

function onServerInit()
{
	serverSetGamemodeName("RolePlay")
	pickupCreate("2tommy.i3d",-1,-1984.0,-4.0,23.0,1.0)
}

function onPickupTaken(pickupid,playerid)
{
	print("onPickupTaken - "+pickupid+", "+playerid)
}

function onPlayerConnect(playerid)
{
	playerToggleCityMusic(playerid,0)
	playerEnableMoney(playerid, 1)

	print(playerGetName(playerid)+"["+playerid+"] has been connected to the server.")
}

function onPlayerSpawn(playerid)
{
	
}

function onPlayerDisconnect(playerid)
{
	
}

function onPlayerCommand(playerid,message,params)
{
	if (message == "v") 
	{
		local pos = _playerGetPosition(playerid)
		if (params.tointeger() > 69)
		{
			sendPlayerMessage(playerid,RGBToHex(color_mes.red) + "[ERROR] Wrong ID") 
			return
		}

		local spl = split(params, " ")
		/*if (car[playerid] != false)
		{
			vehicleDelete(car[playerid])
		}*/

		car[playerid] = _vehicleSpawn(spl[0],spl[1], pos[0]+3,pos[1],pos[2],1.0,0.0,0.0)
	}
	else if (message == "pos") 
	{
		local pos = _playerGetPosition(playerid)
		print("POSITION "+params+": "+pos[0]+","+pos[1]+","+pos[2])
	} 
	else if (message == "getfuel") 
	{
		local vehicle = playerInVehicleID(playerid)
		_playerAddConsoleText(playerid, RGBToHex(color_mes.white), "fuel "+vehicleGetFuel(vehicle))
	}
	else if (message == "setmoney") 
	{
		local money = params.tointeger()
		playerSetMoney(playerid, money)
		_playerAddConsoleText(playerid, RGBToHex(color_mes.white), "+"+money+"$")
	}
	else 
	{
		//sendPlayerMessage(playerid,RGBToHex(color_mes.red) + "[ERROR] onPlayerCommand - "+message+", "+params)
	}
}