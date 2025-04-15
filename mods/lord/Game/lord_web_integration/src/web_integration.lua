local Storage      = require("web_integration.Storage")
local Logger       = require("web_integration.Logger")
local Player       = require("web_integration.Player")
local Clan         = require("web_integration.Clan")
local sync_command = require("web_integration.sync_command")


local register_for_players = function()
	minetest.register_on_joinplayer(function(player, last_login)
		if not player:is_player() then return end

		if not last_login then -- player is new
			Player.create(player, nil, true)
		else -- player Not new
			Player.update_or_create(player, nil, true)
		end
	end)

	minetest.register_on_leaveplayer(function(player, _)
		Player.offline(player)
	end)

end

local register_for_clans = function()
	clans.on_clan_created(Clan.create)
	clans.on_clan_deleted(Clan.delete)
	clans.on_clan_player_added(Clan.player_add)
	clans.on_clan_player_removed(Clan.player_del)
	clans.on_clan_player_join(Clan.is_online)
	clans.on_clan_player_leave(Clan.set_is_online)
	clans.on_clan_blocked(Clan.set_blocked)
	clans.on_clan_unblocked(Clan.set_unblocked)
end


return {
	--- @param mod minetest.Mod
	init = function(mod)
		if not rawget(_G, "web_api") then
			-- Don't use `mod.logger` here. This will create new Logger instance, but it will not be used.
			minetest.log(
				"warning",
				"[" .. mod.name .. "] Can't initialize `lord_web_integration`: Global variable `web_api` not found: " ..
					"mod `lord_wed_api` not loaded or not initialized.")
			return
		end

		mod.logger = Logger.extend(mod.logger)

		Player.init(Storage, mod.logger)
		Clan.init(Storage, mod.logger)

		register_for_players()
		register_for_clans()

		sync_command.register(Storage, Player, Clan)
	end,
}
