local S    = minetest.get_mod_translator()
local tile = minetest.tile

-- Ores:

minetest.register_node("lottores:limestone_ore", {
	description = S("Limestone Ore"),
	tiles = {"default_stone.png^lottores_limestone_ore.png"},
	is_ground_content = true,
	groups = {cracky=3},
	drop = 'lottores:limestone_lump',
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("lottores:rough_rock", {
	description = S("Rough Rock"),
	tiles = {"default_stone.png^lottores_rough_rock.png"},
	is_ground_content = true,
	groups = {cracky=2},
	drop = 'lottores:rough_rock_lump',
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("lottores:silver_ore", {
	description = S("Silver Ore"),
	tiles = {"default_stone.png^lottores_silver_ore.png"},
	is_ground_content = true,
	groups = {cracky=2},
	drop = 'lottores:silver_lump',
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("lottores:tin_ore", {
	description = S("Tin Ore"),
	tiles = {"default_stone.png^lottores_tin_ore.png"},
	is_ground_content = true,
	groups = {cracky=3},
	drop = "lottores:tin_lump",
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("lottores:lead_ore", {
	description = S("Lead Ore"),
	tiles = {"default_stone.png^lottores_lead_ore.png"},
	is_ground_content = true,
	groups = {cracky=2},
	drop = "lottores:lead_lump",
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("lottores:mithril_ore", {
	description = S("Mithril Ore"),
	tiles = {"default_stone.png^lottores_mithril_ore.png"},
	is_ground_content = true,
	groups = {cracky=1},
	drop = "lottores:mithril_lump",
	sounds = default.node_sound_stone_defaults(),
})

--- Gems ores ---


minetest.register_node("lottores:blue_gem_ore", {
	description       = S("Blue Gem Ore"),
	tiles             = { tile.anim_vertical_frames("lottores_bluegem_ore_anim.png", 1.5, "default_stone.png", 16) },
	paramtype         = "light",
	light_source      = 2,
	is_ground_content = true,
	groups            = { cracky = 1 },
	drop              = { items = {
		{ items = { 'lottores:blue_gem' }, rarity = 5, },
		{ items = { '' }, }
	} },
	sounds            = default.node_sound_stone_defaults(),
})

minetest.register_node("lottores:white_gem_ore", {
	description       = S("White Gem Ore"),
	tiles             = { tile.anim_vertical_frames("lottores_whitegem_ore_anim.png", 1.5, "default_stone.png", 16) },
	paramtype         = "light",
	light_source      = 2,
	is_ground_content = true,
	groups            = { cracky = 1 },
	drop              = { items = {
		{ items = { 'lottores:white_gem' }, rarity = 5, },
		{ items = { '' }, }
	} },
	sounds            = default.node_sound_stone_defaults(),
})

minetest.register_node("lottores:red_gem_ore", {
	description       = S("Red Gem Ore"),
	tiles             = { tile.anim_vertical_frames("lottores_redgem_ore_anim.png", 1.5, "default_stone.png", 16) },
	paramtype         = "light",
	light_source      = 2,
	is_ground_content = true,
	groups            = { cracky = 1 },
	drop              = { items = {
		{ items = { 'lottores:red_gem' }, rarity = 5, },
		{ items = { '' }, }
	} },
	sounds            = default.node_sound_stone_defaults(),
})

-- Craft Items

minetest.register_craftitem("lottores:limestone_lump", {
	description = S("Limestone Lump"),
	inventory_image = "lottores_limestone_lump.png",
})

minetest.register_craftitem("lottores:rough_rock_lump", {
	description = S("Rough Rock Lump"),
	inventory_image = "lottores_rough_rock_lump.png",
})

minetest.register_craftitem("lottores:silver_lump", {
	description = S("Silver Lump"),
	inventory_image = "lottores_silver_lump.png",
})

minetest.register_craftitem("lottores:silver_ingot", {
	description = S("Silver Ingot"),
	inventory_image = "lottores_silver_ingot.png",
})

minetest.register_craftitem("lottores:tin_lump", {
	description = S("Tin Lump"),
	inventory_image = "lottores_tin_lump.png",
})

minetest.register_craftitem("lottores:tin_ingot", {
	description = S("Tin Ingot"),
	inventory_image = "lottores_tin_ingot.png",
})

minetest.register_craftitem("lottores:lead_lump", {
	description = S("Lead Lump"),
	inventory_image = "lottores_lead_lump.png",
})

minetest.register_craftitem("lottores:lead_ingot", {
	description = S("Lead Ingot"),
	inventory_image = "lottores_lead_ingot.png",
})

minetest.register_craftitem("lottores:mithril_lump", {
	description = S("Mithril Lump"),
	inventory_image = "lottores_mithril_lump.png",
})

minetest.register_craftitem("lottores:mithril_ingot", {
	description = S("Mithril Ingot"),
	inventory_image = "lottores_mithril_ingot.png",
})

minetest.register_craftitem("lottores:galvorn_ingot", {
	description = S("Galvorn Ingot"),
	inventory_image = "lottores_galvorn_ingot.png",
     groups = {forbidden=1},
})

minetest.register_craftitem("lottores:tilkal_ingot", {
	description = S("Tilkal Ingot"),
	inventory_image = "lottores_tilkal_ingot.png",
     groups = {forbidden=1},
})

-- Nodes

minetest.register_node("lottores:tilkal", {
	description = S("Tilkal"),
	tiles = {"lottores_tilkal.png"},
	sounds = default.node_sound_metal_defaults(),
	groups = {forbidden=1},
})

minetest.register_node("lottores:limestone", {
	description = S("Limestone"),
	tiles = {"lottores_limestone_ore.png"},
	is_ground_content = true,
	groups = {cracky=3, stone=1},
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("lottores:marble", {
	description = S("Marble"),
	tiles = {"lottores_marble.png"},
	is_ground_content = true,
	groups = {cracky=1, stone=1},
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("lottores:geodes_crystal_1", {
	description = S("Geodes Crystal"),
	drawtype = "nodebox",
	tiles = {"lottores_geodes_crystal.png"},
	paramtype = "light",
	sunlight_propagates = true,
	light_source = 8,
	use_texture_alpha = "blend",
	is_ground_content = false,
	groups = {cracky=3,oddly_breakable_by_hand=3},
	sounds = default.node_sound_glass_defaults(),
     node_box = {
        type = "fixed",
        fixed = {
            {-0.1875,-0.5,-0.125,0.1875,0.3125,0.1875},
            {0.0625,-0.5,-0.25,0.3125,0,0},
            {0.0625,-0.5,0.1875,0.25,0.1875,0.375},
            {-0.3125,-0.5,-0.3125,-0.0625,0.0625,0},
            {-0.375,-0.5,0.0625,-0.125,-0.0625,0.3125},
        }
    },
     on_place = function(itemstack, placer, pointed_thing)
		local stack = ItemStack("lottores:geodes_crystal_"..math.random(1,5))
		local ret = minetest.item_place(stack, placer, pointed_thing)
		return ItemStack("lottores:geodes_crystal_1 "..itemstack:get_count()-(1-ret:get_count()))
	end,
})

minetest.register_node("lottores:geodes_crystal_2", {
	drawtype = "nodebox",
	tiles = {"lottores_geodes_crystal.png"},
	paramtype = "light",
	sunlight_propagates = true,
	light_source = 8,
	use_texture_alpha = "blend",
	is_ground_content = false,
	groups = {cracky=3,oddly_breakable_by_hand=3,not_in_creative_inventory=1},
	sounds = default.node_sound_glass_defaults(),
     drop = "lottores:geodes_crystal_1",
     node_box = {
        type = "fixed",
        fixed = {
            {-0.1875,-0.5,-0.125,0.1875,0.5,0.1875},
            {0.1875,-0.5,-0.25,0.5,0.1875,0},
            {0.0625,-0.5,0.1875,0.375,0.375,0.375},
            {-0.375,-0.5,-0.3125,-0.0625,0.25,0},
            {-0.5,-0.5,-0.0625,-0.125,0,0.3125},
            {0,-0.5,-0.5,0.3125,-0.0625,-0.1875},
        }
    }
})

minetest.register_node("lottores:geodes_crystal_3", {
	drawtype = "nodebox",
	tiles = {"lottores_geodes_crystal.png"},
	paramtype = "light",
	sunlight_propagates = true,
	light_source = 8,
	use_texture_alpha = "blend",
	is_ground_content = false,
	groups = {cracky=3,oddly_breakable_by_hand=3,not_in_creative_inventory=1},
	sounds = default.node_sound_glass_defaults(),
     drop = "lottores:geodes_crystal_1",
     node_box = {
        type = "fixed",
        fixed = {
            {-0.125,-0.5,-0.25,0.25,0.5,0.1875},
            {-0.125,-0.5,-0.4375,0.125,0.25,-0.1875},
            {0,-0.5,-0.125,0.461539,0,0.3125},
            {-0.5,-0.5,0,-0.0625,0.25,0.413465},
            {-0.375,-0.5,-0.25,-0.0625,-0.0625,0.0625},
            {0.1875,-0.5,-0.5,0.5,-0.25,-0.1875},
            {-0.4375,-0.5,-0.5,-0.0625,-0.25,-0.125},
        }
    }
})

minetest.register_node("lottores:geodes_crystal_4", {
	drawtype = "nodebox",
	tiles = {"lottores_geodes_crystal.png"},
	paramtype = "light",
	sunlight_propagates = true,
	light_source = 8,
	use_texture_alpha = "blend",
	is_ground_content = false,
	groups = {cracky=3,oddly_breakable_by_hand=3,not_in_creative_inventory=1},
	sounds = default.node_sound_glass_defaults(),
     drop = "lottores:geodes_crystal_1",
     node_box = {
        type = "fixed",
        fixed = {
            {0.125,-0.5,-0.25,0.5,-0.125,0.125},
            {-0.125,-0.5,-0.0625,0.1875,0.375,0.3125},
            {0.0625,-0.5,-0.5,0.375,-0.0625,-0.125},
            {-0.3125,-0.5,-0.3125,0,-0.1875,0.0625},
            {-0.0625,-0.5,-0.1875,0.375,0.25,0.125},
            {-0.375,-0.5,0.125,0,0.25,0.5},
        }
    }
})

minetest.register_node("lottores:geodes_crystal_5", {
	drawtype = "nodebox",
	tiles = {"lottores_geodes_crystal.png"},
	paramtype = "light",
	sunlight_propagates = true,
	light_source = 8,
	use_texture_alpha = "blend",
	is_ground_content = false,
	groups = {cracky=3,oddly_breakable_by_hand=3,not_in_creative_inventory=1},
	sounds = default.node_sound_glass_defaults(),
     drop = "lottores:geodes_crystal_1",
     node_box = {
        type = "fixed",
        fixed = {
            {-0.3125,-0.5,-0.1875,0,0.5,0.125},
            {-0.1875,-0.5,-0.3125,0.1875,0.125,0},
            {-0.25,-0.5,-0.5,0.0625,0.3125,-0.1875},
            {0.0625,-0.5,-0.125,0.375,-0.125,0.1875},
            {0.0625,-0.5,-0.375,0.3125,-0.25,-0.1875},
            {-0.1875,-0.5,0,0.125,0.0625,0.5},
        }
    }
})

minetest.register_node("lottores:silver_block", {
	description = S("Silver Block"),
	tiles = {"lottores_silver_block.png"},
	is_ground_content = true,
	groups = {cracky=1,level=2},
	sounds = default.node_sound_metal_defaults(),
})

minetest.register_node("lottores:tin_block", {
	description = S("Tin Block"),
	tiles = {"lottores_tin_block.png"},
	is_ground_content = true,
	groups = {cracky=1},
	sounds = default.node_sound_metal_defaults(),
})

minetest.register_node("lottores:lead_block", {
	description = S("Lead Block"),
	tiles = {"lottores_lead_block.png"},
	is_ground_content = true,
	groups = {cracky=1},
	sounds = default.node_sound_metal_defaults(),
})

minetest.register_node("lottores:mithril_block", {
	description = S("Mithril Block"),
	tiles = {"lottores_mithril_block.png"},
	is_ground_content = true,
	groups = {cracky=1,level=2},
	sounds = default.node_sound_metal_defaults(),
})

minetest.register_node("lottores:galvorn_block", {
	description = S("Galvorn Block"),
	tiles = {"lottores_galvorn_block.png"},
	is_ground_content = true,
	groups = {cracky=1,level=2,forbidden=1},
	sounds = default.node_sound_metal_defaults(),
})

-- Ithildin

minetest.register_node("lottores:ithildin_0", {
	description = S("Ithildin"),
	tiles = {"ithildin_0.png"},
	drawtype = "glasslike",
	paramtype = "light",
	walkable = false,
	pointable = false,
	sunlight_propagates = true,
	drop = "lottores:ithildin_1",
	groups = {snappy=2,cracky=3, not_in_creative_inventory=1},
	sounds = default.node_sound_glass_defaults(),
})

minetest.register_node("lottores:ithildin_1", {
	description = S("Ithildin"),
	tiles = {"ithildin_1.png"},
	inventory_image = "ithildin_1.png",
	wield_image = "ithildin_1.png",
	paramtype = "light",
	drawtype = 'glasslike',
	walkable = false,
	pointable = true,
	sunlight_propagates = true,
	light_source = 8,
	drop = "lottores:ithildin_1",
	groups = {snappy=2,cracky=3,forbidden=1},
	sounds = default.node_sound_glass_defaults(),
})

minetest.register_node("lottores:ithildin_stone_0", {
	description = S("Ithildin Stone"),
	tiles = {"default_stone.png"},
	drawtype = 'normal',
	walkable = true,
	pointable = true,
	sunlight_propagates = false,
	drop = "lottores:ithildin_stone_1",
	groups = {snappy=2,cracky=3, not_in_creative_inventory=1},
	sounds = default.node_sound_glass_defaults(),
})

minetest.register_node("lottores:ithildin_stone_1", {
	description = S("Ithildin Stone"),
	tiles = {"ithildin_1.png"},
	drawtype = 'glasslike',
	walkable = false,
	pointable = true,
	sunlight_propagates = false,
	light_source = 8,
	drop = "lottores:ithildin_stone_1",
	groups = {snappy=2,cracky=3,forbidden=1},
	sounds = default.node_sound_glass_defaults(),
})

minetest.register_node("lottores:ithildin_stonelamp_0", {
	description = S("Ithildin Stonelamp"),
	tiles = {"default_stone.png"},
	drawtype = 'normal',
	walkable = true,
	pointable = true,
	sunlight_propagates = false,
	drop = "lottores:ithildin_stonelamp_1",
	groups = {snappy=2,cracky=3, not_in_creative_inventory=1},
	sounds = default.node_sound_glass_defaults(),
})

minetest.register_node("lottores:ithildin_stonelamp_1", {
	description = S("Ithildin Stonelamp"),
	tiles = {"default_stone.png^ithildin_lamp_1.png"},
	drawtype = 'normal',
	walkable = true,
	pointable = true,
	sunlight_propagates = false,
	light_source = 8,
	drop = "lottores:ithildin_stonelamp_1",
	groups = {snappy=2,cracky=3,forbidden=1},
	sounds = default.node_sound_glass_defaults(),
})

minetest.register_node("lottores:ithildin_lamp_0", {
	description = S("Ithildin Lamp"),
	tiles = {"ithildin_lamp_0.png"},
	paramtype = "light",
	drawtype = 'glasslike',
	walkable = false,
	pointable = false,
	sunlight_propagates = true,
	drop = "lottores:ithildin_lamp_1",
	groups = {snappy=2,cracky=3, not_in_creative_inventory=1},
	sounds = default.node_sound_glass_defaults(),
})

minetest.register_node("lottores:ithildin_lamp_1", {
	description = S("Ithildin Lamp"),
	tiles = {"default_stone.png^ithildin_lamp_1.png"},
	paramtype = "light",
	drawtype = 'glasslike',
	walkable = true,
	pointable = true,
	sunlight_propagates = true,
	light_source = 8,
	drop = "lottores:ithildin_lamp_1",
	groups = {snappy=2,cracky=3,forbidden=1},
	sounds = default.node_sound_glass_defaults(),
})

-- Functions

minetest.register_abm(
	{nodenames = {"lottores:ithildin_1"},
	interval = 1,
	chance = 1,
	action = function(pos, node, active_object_count, active_object_count_wider)
		if minetest.get_timeofday() > 0.2 and minetest.get_timeofday() < 0.8
		then
			minetest.set_node(pos, {name="lottores:ithildin_0"})
		end
	end,
})

minetest.register_abm(
	{nodenames = {"lottores:ithildin_0"},
	interval = 1,
	chance = 1,
	action = function(pos, node, active_object_count, active_object_count_wider)
		if minetest.get_timeofday() < 0.2 or minetest.get_timeofday() > 0.8
		then
			minetest.set_node(pos, {name="lottores:ithildin_1"})
		end
	end,
})

minetest.register_abm(
	{nodenames = {"lottores:ithildin_stone_1"},
	interval = 1,
	chance = 1,
	action = function(pos, node, active_object_count, active_object_count_wider)
		if minetest.get_timeofday() > 0.2 and minetest.get_timeofday() < 0.8
		then
			minetest.set_node(pos, {name="lottores:ithildin_stone_0"})
		end
	end,
})

minetest.register_abm(
	{nodenames = {"lottores:ithildin_stone_0"},
	interval = 1,
	chance = 1,
	action = function(pos, node, active_object_count, active_object_count_wider)
		if minetest.get_timeofday() < 0.2 or minetest.get_timeofday() > 0.8
		then
			minetest.set_node(pos, {name="lottores:ithildin_stone_1"})
		end
	end,
})

minetest.register_abm(
	{nodenames = {"lottores:ithildin_stonelamp_1"},
	interval = 1,
	chance = 1,
	action = function(pos, node, active_object_count, active_object_count_wider)
		if minetest.get_timeofday() > 0.2 and minetest.get_timeofday() < 0.8
		then
			minetest.set_node(pos, {name="lottores:ithildin_stonelamp_0"})
		end
	end,
})

minetest.register_abm(
	{nodenames = {"lottores:ithildin_stonelamp_0"},
	interval = 1,
	chance = 1,
	action = function(pos, node, active_object_count, active_object_count_wider)
		if minetest.get_timeofday() < 0.2 or minetest.get_timeofday() > 0.8
		then
			minetest.set_node(pos, {name="lottores:ithildin_stonelamp_1"})
		end
	end,
})

minetest.register_abm(
	{nodenames = {"lottores:ithildin_lamp_1"},
	interval = 1,
	chance = 1,
	action = function(pos, node, active_object_count, active_object_count_wider)
		if minetest.get_timeofday() > 0.2 and minetest.get_timeofday() < 0.8
		then
			minetest.set_node(pos, {name="lottores:ithildin_lamp_0"})
		end
	end,
})

minetest.register_abm(
	{nodenames = {"lottores:ithildin_lamp_0"},
	interval = 1,
	chance = 1,
	action = function(pos, node, active_object_count, active_object_count_wider)
		if minetest.get_timeofday() < 0.2 or minetest.get_timeofday() > 0.8
		then
			minetest.set_node(pos, {name="lottores:ithildin_lamp_1"})
		end
	end,
})

-- Stairs & Slabs

stairs.register_stair_and_slab(
	"tilkal",
	"lottores:tilkal",
  {forbidden=1},
	{"lottores_tilkal.png"},
	S("Tilkal Stair"),
	S("Tilkal Slab"),
	default.node_sound_metal_defaults(),
	false,
	S("Inner Tilkal Stair"),
	S("Outer Tilkal Stair")
)

stairs.register_stair_and_slab(
	"limestone",
	"lottores:limestone",
  {cracky=3, stone=2},
	{"lottores_limestone_ore.png"},
	S("Limestone Stair"),
	S("Limestone Slab"),
	default.node_sound_stone_defaults(),
	false,
	S("Inner Limestone Stair"),
	S("Outer Limestone Stair")
)

stairs.register_stair_and_slab(
	"marble",
	"lottores:marble",
  {cracky=3},
	{"lottores_marble.png"},
	S("Marble Stair"),
	S("Marble Slab"),
	default.node_sound_stone_defaults(),
	false,
	S("Inner Marble Stair"),
	S("Outer Marble Stair")
)

stairs.register_stair_and_slab(
	"silver_block",
	"lottores:silver_block",
  {cracky=1,level=2},
	{"lottores_silver_block.png"},
	S("Silver Stair"),
	S("Silver Slab"),
	default.node_sound_metal_defaults(),
	false,
	S("Inner Silver Stair"),
	S("Outer Silver Stair")
)

stairs.register_stair_and_slab(
	"tin_block",
	"lottores:tin_block",
  {cracky=1},
	{"lottores_tin_block.png"},
	S("Tin Stair"),
	S("Tin Slab"),
	default.node_sound_metal_defaults(),
	false,
	S("Inner Tin Stair"),
	S("Outer Tin Stair")
)

stairs.register_stair_and_slab(
	"lead_block",
	"lottores:lead_block",
  {cracky=1},
	{"lottores_lead_block.png"},
	S("Lead Stair"),
	S("Lead Slab"),
	default.node_sound_metal_defaults(),
	false,
	S("Inner Lead Stair"),
	S("Outer Lead Stair")
)

stairs.register_stair_and_slab(
	"mithril_block",
	"lottores:mithril_block",
  {cracky=1,level=2},
	{"lottores_mithril_block.png"},
	S("Mithril Stair"),
	S("Mithril Slab"),
	default.node_sound_metal_defaults(),
	false,
	S("Inner Mithril Stair"),
	S("Outer Mithril Stair")
)

stairs.register_stair_and_slab(
	"galvorn_block",
	"lottores:galvorn_block",
  {cracky=1,level=2,forbidden=1},
	{"lottores_galvorn_block.png"},
	S("Galvorn Stair"),
	S("Galvorn Slab"),
	default.node_sound_metal_defaults(),
	false,
	S("Inner Galvorn Stair"),
	S("Outer Galvorn Stair")
)

-- Crafting

minetest.register_craft({
	type = "shapeless",
	output = "lottores:galvorn_ingot",
	recipe = {"lottores:lead_ingot", "default:mese_crystal"}
})

minetest.register_craft({
	output = 'lottores:tilkal',
	recipe = {
		{'lottores:tilkal_ingot', 'lottores:tilkal_ingot', 'lottores:tilkal_ingot'},
		{'lottores:tilkal_ingot', 'lottores:tilkal_ingot', 'lottores:tilkal_ingot'},
		{'lottores:tilkal_ingot', 'lottores:tilkal_ingot', 'lottores:tilkal_ingot'},
	}
})

minetest.register_craft({
	output = 'lottores:tilkal_ingot 9',
	recipe = {
		{'lottores:tilkal'},
	}
})

minetest.register_craft({
	type = "shapeless",
	output = "lottores:tilkal_ingot",
	recipe = {
		"default:copper_ingot",
		"lottores:silver_ingot",
		"lottores:tin_ingot",
		"lottores:lead_ingot",
		"default:steel_ingot",
		"default:gold_ingot",
	}
})

minetest.register_craft({
	output = 'lottores:limestone',
	recipe = {
		{'lottores:limestone_lump', 'lottores:limestone_lump', 'lottores:limestone_lump'},
		{'lottores:limestone_lump', 'lottores:limestone_lump', 'lottores:limestone_lump'},
		{'lottores:limestone_lump', 'lottores:limestone_lump', 'lottores:limestone_lump'},
	}
})

minetest.register_craft({
	output = 'lottores:limestone_lump 9',
	recipe = {
		{'lottores:limestone'},
	}
})

minetest.register_craft({
	type = "cooking",
	output = "lottores:marble",
	recipe = "lottores:limestone",
})

minetest.register_craft({
	type = "cooking",
	output = "lottores:geodes_crystal_1",
	recipe = "lottores:rough_rock_lump",
})

minetest.register_craft({
	output = 'lottores:silver_block',
	recipe = {
		{'lottores:silver_ingot', 'lottores:silver_ingot', 'lottores:silver_ingot'},
		{'lottores:silver_ingot', 'lottores:silver_ingot', 'lottores:silver_ingot'},
		{'lottores:silver_ingot', 'lottores:silver_ingot', 'lottores:silver_ingot'},
	}
})

minetest.register_craft({
	output = 'lottores:silver_ingot 9',
	recipe = {
		{'lottores:silver_block'},
	}
})

minetest.register_craft({
	output = 'lottores:tin_block',
	recipe = {
		{'lottores:tin_ingot', 'lottores:tin_ingot', 'lottores:tin_ingot'},
		{'lottores:tin_ingot', 'lottores:tin_ingot', 'lottores:tin_ingot'},
		{'lottores:tin_ingot', 'lottores:tin_ingot', 'lottores:tin_ingot'},
	}
})

minetest.register_craft({
	output = 'lottores:tin_ingot 9',
	recipe = {
		{'lottores:tin_block'},
	}
})

minetest.register_craft({
	output = 'lottores:lead_block',
	recipe = {
		{'lottores:lead_ingot', 'lottores:lead_ingot', 'lottores:lead_ingot'},
		{'lottores:lead_ingot', 'lottores:lead_ingot', 'lottores:lead_ingot'},
		{'lottores:lead_ingot', 'lottores:lead_ingot', 'lottores:lead_ingot'},
	}
})

minetest.register_craft({
	output = 'lottores:lead_ingot 9',
	recipe = {
		{'lottores:lead_block'},
	}
})

minetest.register_craft({
	output = 'lottores:mithril_block',
	recipe = {
		{'lottores:mithril_ingot', 'lottores:mithril_ingot', 'lottores:mithril_ingot'},
		{'lottores:mithril_ingot', 'lottores:mithril_ingot', 'lottores:mithril_ingot'},
		{'lottores:mithril_ingot', 'lottores:mithril_ingot', 'lottores:mithril_ingot'},
	}
})

minetest.register_craft({
	output = 'lottores:mithril_ingot 9',
	recipe = {
		{'lottores:mithril_block'},
	}
})

minetest.register_craft({
	output = 'lottores:galvorn_block',
	recipe = {
		{'lottores:galvorn_ingot', 'lottores:galvorn_ingot', 'lottores:galvorn_ingot'},
		{'lottores:galvorn_ingot', 'lottores:galvorn_ingot', 'lottores:galvorn_ingot'},
		{'lottores:galvorn_ingot', 'lottores:galvorn_ingot', 'lottores:galvorn_ingot'},
	}
})

minetest.register_craft({
	output = 'lottores:galvorn_ingot 9',
	recipe = {
		{'lottores:galvorn_block'},
	}
})

minetest.register_craft({
	type = "shapeless",
	output = "lottores:ithildin_1",
	recipe = {"lottores:mithril_ingot", "lottores:geodes_crystal_1"}
})

minetest.register_craft({
	type = "shapeless",
	output = "lottores:ithildin_stone_1",
	recipe = {"lottores:ithildin_1", "group:stone"}
})

minetest.register_craft({
	type = "shapeless",
	output = "lottores:ithildin_lamp_1",
	recipe = {"lottores:mithril_ingot", "lottother:blue_torch"}
})

minetest.register_craft({
	type = "shapeless",
	output = "lottores:ithildin_stonelamp_1",
	recipe = {"lottores:ithildin_lamp_1", "group:stone"}
})

--Blocks

minetest.register_node("lottores:mineral_pearl", {
	description = S("Pearl Ore"),
	tiles = {"default_sand.png^lottores_mineral_pearl.png"},
	paramtype = "light",
	is_ground_content = true,
	groups = {snappy=2,cracky=3,oddly_breakable_by_hand=3},
	drop = {
		items = {
			{
				items = {'lottores:pearl'},
			},
			{
				items = {'default:sand'},
			}
		}
	},
	sounds = default.node_sound_sand_defaults(),
})

minetest.register_node("lottores:mineral_salt", {
	description = S("Salt Mineral"),
	tiles = {"default_dirt.png^lottores_mineral_salt.png"},
	paramtype = "light",
	is_ground_content = true,
	groups = {snappy=2,cracky=3,oddly_breakable_by_hand=3},
	drop = {
		items = {
			{
				items = {'lottores:salt'},
			},
			{
				items = {'default:dirt'},
			}
		}
	},
	sounds = default.node_sound_dirt_defaults(),
})

minetest.register_node( "lottores:pearl_block", {
	description = S("Pearl Block"),
	use_texture_alpha = "blend",
	tiles = { "lottores_pearl_block.png" },
	is_ground_content = true,
	groups = {snappy=2,cracky=3,oddly_breakable_by_hand=3},
	sounds = default.node_sound_glass_defaults(),
})

minetest.register_node( "lottores:salt_block", {
	description       = S("Salt Block"),
	tiles             = { "default_clay.png^lottores_salt_block.png" },
	is_ground_content = true,
	groups            = { snappy = 2, cracky = 3, oddly_breakable_by_hand = 3 },
	sounds            = default.node_sound_stone_defaults(),
})

minetest.register_node("lottores:salt", {
	description         = S("Salt"),
	drawtype            = "plantlike",
	visual_scale        = 1.0,
	tiles               = { "lottores_salt.png" },
	inventory_image     = "lottores_salt.png",
	paramtype           = "light",
	sunlight_propagates = true,
	walkable            = false,
	groups              = { fleshy = 3, dig_immediate = 3, flammable = 1 },
	on_use              = minetest.item_eat(1),
	_tt_food_hp         = 1,
	sounds              = default.node_sound_defaults(),
})

-- Craft items

minetest.register_craftitem("lottores:pearl", {
	description = S("Pearl"),
	inventory_image = "lottores_pearl.png",
})

-- Crafting

minetest.register_craft({
	output = 'lottores:salt_block',
	recipe = {
		{'lottores:salt', 'lottores:salt', 'lottores:salt'},
		{'lottores:salt', 'lottores:salt', 'lottores:salt'},
		{'lottores:salt', 'lottores:salt', 'lottores:salt'},
	}
})

minetest.register_craft({
	output = 'lottores:salt 9',
	recipe = {
		{'lottores:salt_block'},
	}
})

minetest.register_craft({
	output = 'lottores:pearl_block',
	recipe = {
		{'lottores:pearl', 'lottores:pearl', 'lottores:pearl'},
		{'lottores:pearl', 'lottores:pearl', 'lottores:pearl'},
		{'lottores:pearl', 'lottores:pearl', 'lottores:pearl'},
	}
})

minetest.register_craft({
	output = 'lottores:pearl 9',
	recipe = {
		{'lottores:pearl_block'},
	}
})

stairs.register_stair_and_slab(
	"pearl",
	"lottores:pearl_block",
	{cracky=3,oddly_breakable_by_hand=3},
	{"lottores_pearl_block.png"},
	S("Pearl Stair"),
	S("Pearl Slab"),
	default.node_sound_glass_defaults(),
	false,
	S("Inner Pearl Stair"),
	S("Outer Pearl Stair")
)

stairs.register_stair_and_slab(
	"salt",
	"lottores:salt_block",
	{cracky=3,oddly_breakable_by_hand=3},
	{"lottores_salt_block.png"},
	S("Salt Stair"),
	S("Salt Slab"),
	default.node_sound_stone_defaults(),
	false,
	S("Inner Salt Stair"),
	S("Outer Salt Stair")
)

-- Cooking
-- Серебро и изделия
minetest.register_craft({
	type = "cooking",
	output = "lottores:silver_ingot",
	recipe = "lottores:silver_lump",
})
minetest.register_craft({
	type = "cooking",
	output = "lottores:silver_ingot",
	recipe = "group:silver_item",
})

-- Мифрил и изделия
minetest.register_craft({
	type = "cooking",
	output = "lottores:mithril_ingot",
	recipe = "lottores:mithril_lump",
})
minetest.register_craft({
	type = "cooking",
	output = "lottores:mithril_ingot",
	recipe = "group:mithril_item",
})

-- Олово и изделия
minetest.register_craft({
	type = "cooking",
	output = "lottores:tin_ingot",
	recipe = "lottores:tin_lump",
})
minetest.register_craft({
	type = "cooking",
	output = "lottores:tin_ingot",
	recipe = "group:tin_item",
})

-- Свинец и изделия
minetest.register_craft({
	type = "cooking",
	output = "lottores:lead_ingot",
	recipe = "lottores:lead_lump",
})
minetest.register_craft({
	type = "cooking",
	output = "lottores:lead_ingot",
	recipe = "group:lead_item",
})

minetest.register_craft({
	type = "cooking",
	output = "lottores:galvorn_ingot",
	recipe = "group:galvorn_item",
})
