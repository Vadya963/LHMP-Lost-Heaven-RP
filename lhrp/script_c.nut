local lastTick = time()
local framesRendered = 0
local FPS = 0
local time_join = time()

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
	local text = "FPS: "+FPS+" | Minute in game: "+((time()-time_join)/60)+" | "+client_time
	
	drawText(text, 2, 0, COLOR_WHITE)
}