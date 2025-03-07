local SL = minetest.get_mod_translator()

-- правила формирования имени
local rules = {
	{
		match = function(name)
			return #name > 2
		end,
		description = SL("Your name must contain more than 2 symbols;"),
	},
	{
		match = function(name)
			return #name <= 24
		end,
		description = SL("Your name must be less than 24 symbols;"),
	},
	{
		match = function(name)
			return not string.match(name, '[^%a_-]')
		end,
		description = SL("Your name must contain letters only; '-' and '_' are also allowed;"),
	},
	{
		match = function(name)
			return string.match(name, "^[A-Z]")
		end,
		description = SL("Your name must begin with capital letters;"),
	},
}

-- возвращает true, если name удовлетворяет всем условиям, и false в противном случае
local function is_correct_name(name)
	for _, rule in pairs(rules) do
		if not rule.match(name) then
			return false
		end
	end

	return true
end

minetest.register_on_prejoinplayer(function(name, ip)
	local list_rules = ""
	for _, rule in pairs(rules) do
		list_rules = list_rules .. "\n- " .. rule.description
	end
	if not minetest.is_singleplayer() and
			not is_correct_name(name) and
			not minetest.player_exists(name) then
		return "\n"..SL("Invalid character name")..list_rules
	end
end)

minetest.register_on_joinplayer(function(player)
	local name = player:get_player_name()
	if not minetest.is_singleplayer() and not is_correct_name(name) then -- ошибка в имени
		minetest.chat_send_player(name, SL("Invalid character name. Contact to the administration."))
	end
end)
