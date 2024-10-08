local pairs, table_concat, tonumber
    = pairs, table.concat, tonumber

local Tab = require('base_classes.Form.Element.Tab')


--- @class base_classes.Form.Mixin.WithTabs: base_classes.Form.Mixin
local WithTabs = {
	--- @static
	--- @protected
	--- @type table<string,number> table with constants of tabs & theirs numbers
	tab          = nil,
	--- @protected
	--- @type base_classes.Form.Element.Tab[]
	tabs         = nil,
	--- @protected
	--- @type number
	current_tab  = nil,
}

--- @protected
--- @param tab_number number one of self.tab.<CONST>'ants.
function WithTabs:switch_tab(tab_number)
	self.current_tab = tab_number
	self:open()
end

--- @public
--- @param tab base_classes.Form.Element.Tab
--- @return self|base_classes.Form.Mixin.WithTabs
function WithTabs:add_tab(tab)
	tab = (tab.form ~= nil) and tab or Tab:new(self, tab)
	self.tabs[#self.tabs+1] = tab

	return self
end

--- @protected
--- @return string
function WithTabs:get_spec_head()
	return 'size[8,9]'
end

--- @protected
--- @param tab_number number one of self.tab.<CONST>'ants. Default: `self.current_tab`
function WithTabs:get_tab_spec(tab_number)
	tab_number = tab_number or self.current_tab
	return self.tabs[tab_number]:get_spec()
end

--- @protected
--- @return string
function WithTabs:get_spec()
	local tabs_titles = {}
	for number, tab in pairs(self.tabs) do
		tabs_titles[#tabs_titles+1] = tab.title
	end

	local formspec = self:get_spec_head() ..
		'tabheader[0,0;current_tab;' .. table_concat(tabs_titles, ',') .. ';'.. self.current_tab ..']'
	formspec = formspec .. self:get_tab_spec()

	return formspec
end

--- @param fields table
--- @return nil|boolean return `true` for stop propagation of handling
function WithTabs:handle(fields)
	local has_handle = self.tabs[self.current_tab] and self.tabs[self.current_tab].handle
	if has_handle then
		return self.tabs[self.current_tab]:handle(fields)
	end
end

--- @static
--- @param class base_classes.Form.Base|base_classes.Form.Mixin.WithTabs
--- @param tabs_numbers  table <string, number>
function WithTabs.mix_to(class, tabs_numbers)
	class.tab         = class.tab or tabs_numbers or {} -- constants `[TAB_NAME] = number`
	class.tabs        = class.tabs or {}
	class.current_tab = table.is_empty(class.tabs) and 0 or 1

	--- @param self base_classes.Form.Base|base_classes.Form.Mixin.WithTabs
	--- @param _    Player
	--- @param _    Position
	class.on_instance(function(self, _, _)
		self.current_tab = 1
		self.tabs = self.tabs or class.tabs or {}
	end)
	--- @param self   base_classes.Form.Base|base_classes.Form.Mixin.WithTabs
	--- @param _      Player
	--- @param fields table|{tab:number}
	class.on_handle(function(self, _, fields)
		if fields.current_tab then
			self:switch_tab(tonumber(fields.current_tab))

			return true -- stop handling propagation
		end
	end)
end


return WithTabs
