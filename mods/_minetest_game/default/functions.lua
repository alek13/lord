-- mods/default/functions.lua

-- проверка на возможность роста деревьев
function default.can_grow(pos)
	local n
	for p = pos.y + 1, pos.y + 20 do
		n = minetest.get_node({ x = pos.x, y = p, z = pos.z })
		if (n.name ~= "air") then
			return false
		end
	end
	local node_under = minetest.get_node_or_nil({ x = pos.x, y = pos.y - 1, z = pos.z })
	if not node_under then
		return false
	end
	local name_under = node_under.name
	local is_soil    = minetest.get_item_group(name_under, "soil")
	if is_soil == 0 then
		return false
	end
	local light_level = minetest.get_node_light(pos)
	if not light_level or light_level < 13 then
		return false
	end

	return true
end

--
-- Sounds
--

function default.node_sound_defaults(table)
	table          = table or {}
	table.footstep = table.footstep or { name = "", gain = 1.0 }
	table.dug      = table.dug or { name = "default_dug_node", gain = 0.25 }
	table.place    = table.place or { name = "default_place_node_hard", gain = 1.0 }

	return table
end

function default.node_sound_stone_defaults(table)
	table          = table or {}
	table.footstep = table.footstep or { name = "default_hard_footstep", gain = 0.5 }
	table.dug      = table.dug or { name = "default_hard_footstep", gain = 1.0 }

	default.node_sound_defaults(table)

	return table
end

function default.node_sound_dirt_defaults(table)
	table          = table or {}
	table.footstep = table.footstep or { name = "default_dirt_footstep", gain = 1.0 }
	table.dug      = table.dug or { name = "default_dirt_footstep", gain = 1.5 }
	table.place    = table.place or { name = "default_place_node", gain = 1.0 }

	default.node_sound_defaults(table)

	return table
end

function default.node_sound_sand_defaults(table)
	table          = table or {}
	table.footstep = table.footstep or { name = "default_sand_footstep", gain = 0.5 }
	table.dug      = table.dug or { name = "default_sand_footstep", gain = 1.0 }
	table.place    = table.place or { name = "default_place_node", gain = 1.0 }

	default.node_sound_defaults(table)

	return table
end

function default.node_sound_gravel_defaults(table)
	table = table or {}
	table.footstep = table.footstep or
			{name = "default_gravel_footstep", gain = 0.4}
	table.dug = table.dug or
			{name = "default_gravel_footstep", gain = 1.0}
	table.place = table.place or
			{name = "default_place_node", gain = 1.0}
	default.node_sound_defaults(table)
	return table
end

function default.node_sound_wood_defaults(table)
	table          = table or {}
	table.footstep = table.footstep or { name = "default_wood_footstep", gain = 0.5 }
	table.dug      = table.dug or { name = "default_wood_footstep", gain = 1.0 }

	default.node_sound_defaults(table)

	return table
end

function default.node_sound_leaves_defaults(table)
	table          = table or {}
	table.footstep = table.footstep or { name = "default_grass_footstep", gain = 0.35 }
	table.dug      = table.dug or { name = "default_grass_footstep", gain = 0.85 }
	table.dig      = table.dig or { name = "default_dig_crumbly", gain = 0.4 }
	table.place    = table.place or { name = "default_place_node", gain = 1.0 }

	default.node_sound_defaults(table)

	return table
end

function default.node_sound_glass_defaults(table)
	table          = table or {}
	table.footstep = table.footstep or { name = "default_glass_footstep", gain = 0.5 }
	table.dug      = table.dug or { name = "default_break_glass", gain = 1.0 }

	default.node_sound_defaults(table)

	return table
end

function default.node_sound_metal_defaults(table)
	table = table or {}
	table.footstep = table.footstep or
			{name = "default_metal_footstep", gain = 0.4}
	table.dig = table.dig or
			{name = "default_dig_metal", gain = 0.5}
	table.dug = table.dug or
			{name = "default_dug_metal", gain = 0.5}
	table.place = table.place or
			{name = "default_place_node_metal", gain = 0.5}
	default.node_sound_defaults(table)
	return table
end

function default.node_sound_water_defaults(table)
	table = table or {}
	table.footstep = table.footstep or
			{name = "default_water_footstep", gain = 0.2}
	default.node_sound_defaults(table)
	return table
end

function default.node_sound_snow_defaults(table)
	table = table or {}
	table.footstep = table.footstep or
			{name = "default_snow_footstep", gain = 0.2}
	table.dig = table.dig or
			{name = "default_snow_footstep", gain = 0.3}
	table.dug = table.dug or
			{name = "default_snow_footstep", gain = 0.3}
	table.place = table.place or
			{name = "default_place_node", gain = 1.0}
	default.node_sound_defaults(table)
	return table
end


--
-- Legacy
--

function default.spawn_falling_node(p, nodename)
	spawn_falling_node(p, nodename)
end

-- Horrible crap to support old code
-- Don't use this and never do what this does, it's completely wrong!
-- (More specifically, the client and the C++ code doesn't get the group)
function default.register_falling_node(nodename, texture)
	minetest.log("error", debug.traceback())
	minetest.log('error', "WARNING: default.register_falling_node is deprecated")
	if minetest.registered_nodes[nodename] then
		minetest.registered_nodes[nodename].groups.falling_node = 1
	end
end

--
-- Global callbacks
--

-- Global environment step function
function on_step(dtime)
	-- print("on_step")
end
minetest.register_globalstep(on_step)

function on_placenode(p, node)
	--print("on_placenode")
end
minetest.register_on_placenode(on_placenode)

function on_dignode(p, node)
	--print("on_dignode")
end
minetest.register_on_dignode(on_dignode)

function on_punchnode(p, node)
end
minetest.register_on_punchnode(on_punchnode)


--
-- Lavacooling
--

default.cool_lava_source  = function(pos)
	minetest.set_node(pos, { name = "default:obsidian" })
	minetest.sound_play("default_cool_lava", { pos = pos, gain = 0.25 })
end

default.cool_lava_flowing = function(pos)
	minetest.set_node(pos, { name = "default:stone" })
	minetest.sound_play("default_cool_lava", { pos = pos, gain = 0.25 })
end

minetest.register_abm({
	nodenames = { "default:lava_flowing" },
	neighbors = { "group:water" },
	interval  = 1,
	chance    = 1,
	action    = function(pos, node, active_object_count, active_object_count_wider)
		default.cool_lava_flowing(pos, node, active_object_count, active_object_count_wider)
	end,
})

minetest.register_abm({
	nodenames = { "default:lava_source" },
	neighbors = { "group:water" },
	interval  = 1,
	chance    = 1,
	action    = function(pos, node, active_object_count, active_object_count_wider)
		default.cool_lava_source(pos, node, active_object_count, active_object_count_wider)
	end,
})

--
-- Papyrus and cactus growing
--

minetest.register_abm({
	nodenames = { "default:cactus" },
	neighbors = { "group:sand" },
	interval  = 50,
	chance    = 20,
	action    = function(pos, node)
		pos.y      = pos.y - 1
		local name = minetest.get_node(pos).name
		if minetest.get_item_group(name, "sand") ~= 0 then
			pos.y        = pos.y + 1
			local height = 0
			while minetest.get_node(pos).name == "default:cactus" and height < 4 do
				height = height + 1
				pos.y  = pos.y + 1
			end
			if height < 4 then
				if minetest.get_node(pos).name == "air" then
					minetest.set_node(pos, { name = "default:cactus" })
				end
			end
		end
	end,
})

minetest.register_abm({
	nodenames = { "default:papyrus" },
	neighbors = { "group:soil", "default:sand" },
	interval  = 50,
	chance    = 20,
	action    = function(pos, node)
		pos.y      = pos.y - 1
		local name = minetest.get_node(pos).name
		if (minetest.registered_nodes[name].groups["soil"]) or (name == "default:sand") then
			if minetest.find_node_near(pos, 3, { "group:water" }) == nil then
				return
			end
			pos.y        = pos.y + 1
			local height = 0
			while minetest.get_node(pos).name == "default:papyrus" and height < 4 do
				height = height + 1
				pos.y  = pos.y + 1
			end
			if height < 4 then
				if minetest.get_node(pos).name == "air" then
					minetest.set_node(pos, { name = "default:papyrus" })
				end
			end
		end
	end,
})

--
-- dig upwards
--

function default.dig_up(pos, node, digger)
	if digger == nil then return end
	local np = { x = pos.x, y = pos.y + 1, z = pos.z }
	local nn = minetest.get_node(np)
	if nn.name == node.name then
		minetest.node_dig(np, nn, digger)
	end
end


--
-- Leafdecay
--

-- To enable leaf decay for a node, add it to the "leafdecay" group.
--
-- The rating of the group determines how far from a node in the group "tree"
-- the node can be without decaying.
--
-- If param2 of the node is ~= 0, the node will always be preserved. Thus, if
-- the player places a node of that kind, you will want to set param2=1 or so.
--
-- If the node is in the leafdecay_drop group then the it will always be dropped
-- as an item

default.leafdecay_trunk_cache = {}
default.leafdecay_enable_cache = true
-- Spread the load of finding trunks
default.leafdecay_trunk_find_allow_accumulator = 0

minetest.register_globalstep(function(dtime)
	local finds_per_second                         = 5000
	default.leafdecay_trunk_find_allow_accumulator = math.floor(dtime * finds_per_second)
end)

minetest.register_abm({
	nodenames = { "group:leafdecay" },
	neighbors = { "air", "group:liquid" },
	-- A low interval and a high inverse chance spreads the load
	interval  = 2,
	chance    = 5,

	action    = function(p0, node, _, _)
		--print("leafdecay ABM at "..p0.x..", "..p0.y..", "..p0.z..")")
		local do_preserve = false
		local d           = minetest.registered_nodes[node.name].groups.leafdecay
		if not d or d == 0 then
			--print("not groups.leafdecay")
			return
		end
		local n0 = minetest.get_node(p0)
		if n0.param2 ~= 0 then
			--print("param2 ~= 0")
			return
		end
		local p0_hash = nil
		if default.leafdecay_enable_cache then
			p0_hash      = minetest.hash_node_position(p0)
			local trunkp = default.leafdecay_trunk_cache[p0_hash]
			if trunkp then
				local n   = minetest.get_node(trunkp)
				local reg = minetest.registered_nodes[n.name]
				-- Assume ignore is a trunk, to make the thing work at the border of the active area
				if n.name == "ignore" or (reg and reg.groups.tree and reg.groups.tree ~= 0) then
					--print("cached trunk still exists")
					return
				end
				-- Cache is invalid
				table.remove(default.leafdecay_trunk_cache, p0_hash)
			end
		end
		if default.leafdecay_trunk_find_allow_accumulator <= 0 then
			return
		end
		default.leafdecay_trunk_find_allow_accumulator = default.leafdecay_trunk_find_allow_accumulator - 1
		-- Assume ignore is a trunk, to make the thing work at the border of the active area
		local p1                                       = minetest.find_node_near(p0, d, { "ignore", "group:tree" })
		if p1 then
			do_preserve = true
			if default.leafdecay_enable_cache then
				-- Cache the trunk
				default.leafdecay_trunk_cache[p0_hash] = p1
			end
		end
		if not do_preserve then
			-- Drop stuff other than the node itself
			local itemstacks = minetest.get_node_drops(n0.name)
			for _, itemname in ipairs(itemstacks) do
				if minetest.get_item_group(n0.name, "leafdecay_drop") ~= 0 or
					itemname ~= n0.name then
					local p_drop = {
						x = p0.x - 0.5 + math.random(),
						y = p0.y - 0.5 + math.random(),
						z = p0.z - 0.5 + math.random(),
					}
					minetest.add_item(p_drop, itemname)
				end
			end
			-- Remove node
			minetest.remove_node(p0)
			minetest.check_for_falling(p0)
		end
	end
})

--This allows trees act *almost* like falling nodes, useful for big trees!

local falling_trees = minetest.settings:get_bool("falling_trees")

if not falling_trees then
	if minetest.is_singleplayer() then
		falling_trees = false
	else
		falling_trees = true
	end
end

if falling_trees == true then
	function default.dig_tree(pos, node, name, digger, height, radius, drop)
		minetest.node_dig(pos, node, digger)

		if minetest.is_protected(pos, digger:get_player_name()) then
			return
		end

		local base_y = pos.y
		for i = 1, (height + 5) do
			pos.y        = base_y + i
			local node_i = minetest.get_node(pos)
			if node_i.name ~= name or i == (height + 5) then
				minetest.remove_node({ x = pos.x, y = pos.y - 1, z = pos.z })
				for k = -radius, radius do
					for l = -radius, radius do
						for j = 0, 1 do
							local tree_bellow = minetest.get_node({ x = pos.x + k, y = pos.y - 1, z = pos.z + l })
							if tree_bellow.name ~= name then
								local pos1 = { x = pos.x + k, y = pos.y + j, z = pos.z + l }
								if minetest.get_node(pos1).name == name then
									minetest.spawn_item(pos1, drop)
									minetest.remove_node(pos1)
								end
							end
						end
					end
				end
				return
			elseif node_i.name == name then
				minetest.set_node({ x = pos.x, y = pos.y - 1, z = pos.z }, { name = name })
			end
		end
	end
else
	function default.dig_tree(pos, node, name, digger, height, radius, drop)
		minetest.node_dig(pos, node, digger)
		return
	end
end

minetest.register_on_punchplayer(function(player, hitter, time_from_last_punch, tool_capabilities)
	local weapon = hitter:get_wielded_item()
	if tool_capabilities ~= nil then
		local wear = ((tool_capabilities.full_punch_interval or 1.4) / 75) * 9000
		weapon:add_wear(wear)
		hitter:set_wielded_item(weapon)
	end
end)

--
-- Register a craft to copy the metadata of items
--

function default.register_craft_metadata_copy(ingredient, result)
	minetest.register_craft({
		type = "shapeless",
		output = result,
		recipe = {ingredient, result}
	})

	minetest.register_on_craft(function(itemstack, player, old_craft_grid, craft_inv)
		if itemstack:get_name() ~= result then
			return
		end

		local original
		local index
		for i = 1, #old_craft_grid do
			if old_craft_grid[i]:get_name() == result then
				original = old_craft_grid[i]
				index = i
			end
		end
		if not original then
			return
		end
		local copymeta = original:get_meta():to_table()
		itemstack:get_meta():from_table(copymeta)
		-- put the book with metadata back in the craft grid
		craft_inv:set_stack("craft", index, original)
	end)
end


--
-- NOTICE: This method is not an official part of the API yet.
-- This method may change in future.
--

function default.can_interact_with_node(player, pos)
	if player and player:is_player() then
		if minetest.check_player_privs(player, "protection_bypass") then
			return true
		end
	else
		return false
	end

	local meta = minetest.get_meta(pos)
	local owner = meta:get_string("owner")

	if not owner or owner == "" or owner == player:get_player_name() then
		return true
	end

	-- Is player wielding the right key?
	local item = player:get_wielded_item()
	if minetest.get_item_group(item:get_name(), "key") == 1 then
		local key_meta = item:get_meta()

		if key_meta:get_string("secret") == "" then
			local key_oldmeta = item:get_metadata()
			if key_oldmeta == "" or not minetest.parse_json(key_oldmeta) then
				return false
			end

			key_meta:set_string("secret", minetest.parse_json(key_oldmeta).secret)
			item:set_metadata("")
		end

		return meta:get_string("key_lock_secret") == key_meta:get_string("secret")
	end

	return false
end
