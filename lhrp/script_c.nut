local lastTick = time()
local framesRendered = 0
local FPS = 0
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

	local text = "FPS: "+FPS+" | "+time()
	
	drawText(text, 2, 0, COLOR_WHITE)
}