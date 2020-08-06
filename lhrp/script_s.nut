dofile("gamemodes/lhrp/utils.nut", true)

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

local red = "#ff0000"
local green = "#00ff00"
local blue = "#0000ff"
local yellow = "#ffff00"
local orange = "#ff7700"
local white = "#ffffff"
local gray25 = "#bfbfbf"
local gray50 = "#808080"
local gray75 = "#404040"
local black = "#000000"
local cyan = "#00FFFF"

local spawn_pos = [-575.101,1622.8,-15.6957]//--стартовая позиция

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
		if (params.tointeger() > 169)
		{
			sendPlayerMessage(playerid,red + "[ERROR] Wrong ID") 
			return
		}

		_vehicleSpawn(params,pos[0]+3,pos[1],pos[2],1.0,0.0,0.0)
	}
	else if (message == "pos") 
	{
		local pos = _playerGetPosition(playerid)
		print("POSITION "+params+": "+pos[0]+","+pos[1]+","+pos[2])
	} 
	else 
	{
		//sendPlayerMessage(playerid,red + "[ERROR] onPlayerCommand - "+message+", "+params)
	}
}