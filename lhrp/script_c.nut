local lastTick = time()
local framesRendered = 0
local FPS = 0
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

function onRender () {
	local currentTick = time()
	local elapsedTime = currentTick - lastTick

	if (elapsedTime == 1)
	{
		FPS = framesRendered
		lastTick = currentTick
		framesRendered = 0
	}
	else
	{
		framesRendered++
	}
	
	local client_time = "Date: "+getRealData()+" Time: "+getRealTime()
	local text = "FPS: "+FPS+" | "+client_time
	
	drawText(text, 2, 0, COLOR_WHITE)
}