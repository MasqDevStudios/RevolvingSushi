-------------------------------------------------
--
-- Seat.lua
--
-- Seat class
--
-------------------------------------------------

local Seat = {}
local Seat_mt = { __index = Seat }	-- metatable

function Seat:new(x,y)
	local newSeat = {
		posX = x
		posY = y
		customer = nil
	}

	return setmetatable( newSeat, Seat_mt )

function Seat:addCustomer(customer)
	if self.customer == nil then
		self.customer = customer
	end
end
