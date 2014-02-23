-------------------------------------------------
--
-- Customer.lua
--
-- Customer class
--
-------------------------------------------------

local Customer = {}
local Customer_mt = { __index = Customer }	-- metatable

local satisfactionN
local satisfactionPercentage

local hungryN
local hungryPercentage

function Customer:new( )
	local newCustomer = {
			
	}

	return setmetatable( newCustomer, Customer_mt )
end

