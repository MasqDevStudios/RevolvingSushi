-------------------------------------------------
--
-- Restaurant.lua
--
-- Restaurant class
--
-------------------------------------------------

local Restaurant = {}
local Restaurant_mt = { __index = Restaurant }	-- metatable

function Restaurant:new(name, conveyor)
	local newRestaurant = {
		seatsIndex = 0
		seats = {}
		name = name
		conveyor = conveyor
	}
end

function Restaurant:addSeat(seat)
	seats[seatsIndex] = seat
	seatsIndex = seatsIndex + 1
end