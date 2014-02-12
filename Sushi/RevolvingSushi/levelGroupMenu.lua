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

end

---------------------------------------------------------------------------------
-- MASQ
---------------------------------------------------------------------------------

local background = display.newImage("background.png")
background.x = display.contentWidth / 2
background.y = display.contentHeight / 2

local groupLevel = {}
local leftSpace = 15
local topSpace = 10
local innerSpace = 10
local tilesCount = 10

for i = 1, tilesCount do
    groupLevel[i] = display.newImage("group_level_" .. i .. ".png")

    if ((i % 2) == 1) then
        groupLevel[i].x = leftSpace + (groupLevel[i].width / 2)
    else
        groupLevel[i].x = leftSpace + groupLevel[i].width + innerSpace + (groupLevel[i].width / 2)
    end
end

local iaux = 0

for i = 1, tilesCount-1, 2 do
    if (i == 1) then
        groupLevel[i].y = topSpace + (groupLevel[i].height / 2)
        groupLevel[i+1].y = groupLevel[i].y
    else
        iaux = iaux + 1
        groupLevel[i].y = topSpace + (groupLevel[i].height * iaux) + (innerSpace * iaux) + (groupLevel[i].height / 2)
        groupLevel[i+1].y = groupLevel[i].y
    end
end

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