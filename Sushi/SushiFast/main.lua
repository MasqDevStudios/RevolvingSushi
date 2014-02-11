-----------------------------------------------------------------------------------------
--
-- main.lua
--
-----------------------------------------------------------------------------------------

display.setStatusBar( display.HiddenStatusBar )

local backg = display.newImage("level1.png", 0, 0)
backg.x = display.contentWidth / 2
backg.y = display.contentHeight / 2

local sushiEntry = {}

sushiEntry.x = 317
sushiEntry.y = 644

local sushiCarpet = {}

for i = 1, 16 do 
	sushiCarpet[i] = {}
end 

sushiCarpet[1].x = 317
sushiCarpet[1].y = 644
sushiCarpet[2].x = 217
sushiCarpet[2].y = 644
sushiCarpet[3].x = 217
sushiCarpet[3].y = 544
sushiCarpet[4].x = 117
sushiCarpet[4].y = 544
sushiCarpet[5].x = 117
sushiCarpet[5].y = 444
sushiCarpet[6].x = 117
sushiCarpet[6].y = 344
sushiCarpet[7].x = 217
sushiCarpet[7].y = 344
sushiCarpet[8].x = 217
sushiCarpet[8].y = 244
sushiCarpet[9].x = 317
sushiCarpet[9].y = 244
sushiCarpet[10].x = 417
sushiCarpet[10].y = 244
sushiCarpet[11].x = 417
sushiCarpet[11].y = 344
sushiCarpet[12].x = 517
sushiCarpet[12].y = 344
sushiCarpet[13].x = 517
sushiCarpet[13].y = 444
sushiCarpet[14].x = 517
sushiCarpet[14].y = 544
sushiCarpet[15].x = 417
sushiCarpet[15].y = 544
sushiCarpet[16].x = 417
sushiCarpet[16].y = 644

--local sushiCarpetPosition = 0 

local sushiOnCarpet = {}
local sushiOnCarpetCounter = 0
local sushiOnCarpetLastRemovedIndex = 0

local sushiDispatcherList = {}
local sushiDispatcherCounter = 0
local sushiDispatcherLastRemovedIndex = 0

-- local sushi = display.newImage("sushi.png", 0, 0)

-- sushi.x = 100
-- sushi.y = 100

-- function sushi:tap(event)
-- 	transition.to( sushi, { time = 200, x = sushiEntry.x, y = sushiEntry.y } )
-- end

-- sushi:addEventListener("tap", sushi)

function sushiTap(e)
	transition.to(e.target, { time = 200, x = sushiEntry.x, y = sushiEntry.y, alpha = 0 } )

	sushiOnCarpetCounter = sushiOnCarpetCounter + 1
	sushiOnCarpet[sushiOnCarpetCounter] = {}
	sushiOnCarpet[sushiOnCarpetCounter].object = display.newImage("sushi.png", sushiEntry.x, sushiEntry.y)
	sushiOnCarpet[sushiOnCarpetCounter].position = 1
end

function sushiDispatcher(event)
	sushiDispatcherCounter = sushiDispatcherCounter + 1
	sushiDispatcherList[sushiDispatcherCounter] = display.newImage("sushi.png", 0, 0)
	sushiDispatcherList[sushiDispatcherCounter]:addEventListener("tap", sushiTap)
	sushiDispatcherList[sushiDispatcherCounter].y = display.contentHeight - 130

	for i = sushiDispatcherLastRemovedIndex + 1, sushiDispatcherCounter do
		if (i == sushiDispatcherCounter - 7) then
			--print("i " .. i .. " #sushiDispatcherList - 6 = " .. (#sushiDispatcherList -6) )
			sushiDispatcherLastRemovedIndex = i
			display.remove( sushiDispatcherList[i] )
			sushiDispatcherList[i] = nil
		else
			transition.to( sushiDispatcherList[i], { time = 500, x = sushiDispatcherList[i].x + (display.contentWidth / 6), y = (sushiDispatcherList[i].y) } )
		end
	end
end

timer.performWithDelay(500, sushiDispatcher, 0)

function sushiCarpetMover(event)
	for i = sushiOnCarpetLastRemovedIndex + 1, sushiOnCarpetCounter do
		if (sushiOnCarpet[i].position == #sushiCarpet) then
			transition.to(sushiOnCarpet[i].object, { time = 500, x = sushiCarpet[1].x, y = sushiCarpet[1].y } )
			sushiOnCarpet[i].position = 1
		else
			transition.to(sushiOnCarpet[i].object, { time = 500, x = sushiCarpet[sushiOnCarpet[i].position + 1].x, y = sushiCarpet[sushiOnCarpet[i].position + 1].y } )
			sushiOnCarpet[i].position = sushiOnCarpet[i].position + 1
		end 
	end
end

timer.performWithDelay(500, sushiCarpetMover, 0)