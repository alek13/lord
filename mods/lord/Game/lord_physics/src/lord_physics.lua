local ipairs
    = ipairs

--- @type table<number,string>|string[]
local PHYSICS_TYPES = { "jump", "speed", "gravity" }

--- @param player        Player
local function collect_physics_from_armor(player)
	local physics_delta = {}
	for _, stack in equipment.for_player(player):not_empty(equipment.Kind.ARMOR) do
		local item_groups = stack:get_definition().groups
		for _, type in ipairs(PHYSICS_TYPES) do
			local value = item_groups["physics_" .. type]
			if value then
				physics_delta[type] = (physics_delta[type] or 0) + value
			end
		end
	end

	return physics_delta
end

--- @param player Player
local function set_player_physics(player)
	local physics_delta = collect_physics_from_armor(player)

	physics.for_player(player):set(physics_delta, {
		name = 'armor', description = ''
	})
end


return {
	init = function()
		equipment.on_load(equipment.Kind.ARMOR, function(player)
			set_player_physics(player)
		end)
		equipment.on_change(equipment.Kind.ARMOR, function(player)
			set_player_physics(player)
		end)
	end,
}
