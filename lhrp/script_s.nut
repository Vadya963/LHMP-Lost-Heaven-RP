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
	if (message == "v") {
		local pos = playerGetPosition(playerid)
		if (params.tointeger() > 169)
		{
			sendPlayerMessage(playerid,red + "[ERROR] Wrong ID") 
			return
		}

		vehicleSpawn(params.tointeger(),pos[0]+2,pos[1],pos[2],1.0,0.0,0.0)
	} else {
		// code
	}
}