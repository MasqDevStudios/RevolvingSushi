-------------------------------------------------
--
-- RegularCustomer.lua
--
-- RegularCustomer class
--
-------------------------------------------------

require "Food"
require "Seat"

local RegularCustomer = {}
local RegularCustomer_mt = { __index = RegularCustomer }	-- metatable


function RegularCustomer:new()
	local newRegularCustomer = {
		satisfactionN = 2
		hungryN = 4
		satisfactionPercentage = 0
		hungryPercentage = 0
		irritationSeconds = 10
	}

	return setmetatable( newRegularCustomer, RegularCustomer_mt )
end

function RegularCustomer:eat(food)
	if food.type == "Normal" or food.type == "Cheap" then
		increaseSatisfaction()
		increaseHungry()
	else
		reduceSatisfaction()
		reduceHungry()
	end
end


local function increaseSatisfaction ()
	satisfactionPercentage = satisfactionPercentage + 100 / satisfactionN
end

local function reduceSatisfaction ()
	satisfactionPercentage = satisfactionPercentage - 100 / satisfactionN
end

local function increaseHungry()
	hungryPercentage = hungryPercentage + 100 / hungryN
end

local function reduceHungry()
	hungryPercentage = hungryPercentage - 100 / hungryN
end


