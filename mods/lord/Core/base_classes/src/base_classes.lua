local Event = require("base_classes.Event")
local Form  = require("base_classes.Form")


base_classes = {} -- luacheck: ignore unused global variable base_classes

local function register_api()
	_G.base_classes = {
		--- @type base_classes.Event
		Event = Event,
		--- @type base_classes.Form
		Form  = Form,
	}
end


return {
	init = function()
		register_api()
	end,
}
