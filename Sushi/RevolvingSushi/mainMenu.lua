----------------------------------------------------------------------------------

local storyboard = require( "storyboard" )
local scene = storyboard.newScene()
local appData = require("appData")

----------------------------------------------------------------------------------
-- 
--  NOTE:
--  
--  Code outside of listener functions (below) will only be executed once,
--  unless storyboard.removeScene() is called.
-- 
---------------------------------------------------------------------------------

---------------------------------------------------------------------------------
-- BEGINNING OF YOUR IMPLEMENTATION
---------------------------------------------------------------------------------

-- Called when the scene's view does not exist:
function scene:createScene( event )
    local group = self.view

    -----------------------------------------------------------------------------

    --  CREATE display objects and add them to 'group' here.
    --  Example use-case: Restore 'group' from previously saved state.

    -----------------------------------------------------------------------------

end


-- Called immediately after scene has moved onscreen:
function scene:enterScene( event )
    local group = self.view

    print("entered")

    -----------------------------------------------------------------------------

    --  INSERT code here (e.g. start timers, load audio, start listeners, etc.)

    -----------------------------------------------------------------------------

end


-- Called when scene is about to move offscreen:
function scene:exitScene( event )
    local group = self.view

    -----------------------------------------------------------------------------

    --  INSERT code here (e.g. stop timers, remove listeners, unload sounds, etc.)

    -----------------------------------------------------------------------------

end


-- Called prior to the removal of scene's "view" (display group)
function scene:destroyScene( event )
    local group = self.view

    -----------------------------------------------------------------------------

    --  INSERT code here (e.g. remove listeners, widgets, save state, etc.)

    -----------------------------------------------------------------------------

    storyboard.purgeScene( "mainMenu" )
end

---------------------------------------------------------------------------------
-- MASQ
---------------------------------------------------------------------------------

local background = display.newImage("background.png")
background.x = display.contentWidth / 2
background.y = display.contentHeight / 2

local revolvingSushiLogo = display.newImage("revolving_sushi_logo.png")
revolvingSushiLogo.x = display.contentWidth / 2
revolvingSushiLogo.y = display.contentHeight * 0.25

local play = display.newImage("play.png")
play.x = display.contentWidth / 2
play.y = display.contentHeight * 0.6

local sushiDispatcherList = {}
local sushiDispatcherCounter = 0
local sushiDispatcherLastRemovedIndex = 0

function play:touch(event)
    if (event.phase == "ended" or event.phase == "cancelled") then
        timer.cancel(sushiDispatcherTimer)
        storyboard.gotoScene("levelGroupMenu")
    end 
end

play:addEventListener("touch", play)

function sushiTap(e)
    transition.to(e.target, { time = 500, x = math.random(display.contentWidth), y = math.random(display.contentHeight), alpha = 0 } )
end

function sushiDispatcher(event)
    sushiDispatcherCounter = sushiDispatcherCounter + 1
    sushiDispatcherList[sushiDispatcherCounter] = {}
    sushiDispatcherList[sushiDispatcherCounter] = display.newImage(math.random(24) .. ".png", 0, 0) -- VER ISTO!
    sushiDispatcherList[sushiDispatcherCounter]:addEventListener("tap", sushiTap)
    sushiDispatcherList[sushiDispatcherCounter].x = -sushiDispatcherList[sushiDispatcherCounter].width
    sushiDispatcherList[sushiDispatcherCounter].y = display.contentHeight * 0.9

    for i = sushiDispatcherLastRemovedIndex + 1, sushiDispatcherCounter do
        if (i == sushiDispatcherCounter - 7) then
            sushiDispatcherLastRemovedIndex = i
            display.remove( sushiDispatcherList[i] )
            sushiDispatcherList[i] = nil
        else
            transition.to( sushiDispatcherList[i], { time = 1000, x = sushiDispatcherList[i].x + (display.contentWidth / 6), y = (sushiDispatcherList[i].y) } )
        end
    end
end

sushiDispatcherTimer =  timer.performWithDelay(1000, sushiDispatcher, 0)

-- Load data

---------------------------------------------------------------------------------
-- END OF YOUR IMPLEMENTATION
---------------------------------------------------------------------------------

-- "createScene" event is dispatched if scene's view does not exist
scene:addEventListener( "createScene", scene )

-- "enterScene" event is dispatched whenever scene transition has finished
scene:addEventListener( "enterScene", scene )

-- "exitScene" event is dispatched before next scene's transition begins
scene:addEventListener( "exitScene", scene )

-- "destroyScene" event is dispatched before view is unloaded, which can be
-- automatically unloaded in low memory situations, or explicitly via a call to
-- storyboard.purgeScene() or storyboard.removeScene().
scene:addEventListener( "destroyScene", scene )

---------------------------------------------------------------------------------

return scene

