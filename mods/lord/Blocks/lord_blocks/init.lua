local S = minetest.get_mod_translator()

minetest.register_node("lord_blocks:blackout", {
	description = S("Blackout"),
	tiles = {"default_blackout.png"},
	drawtype = "glasslike",
	paramtype = "light",
	sunlight_propagates = true,
	is_ground_content = false,
    walkable = false,
    buildable_to = true,
    pointable = false,
	groups = {not_in_creative_inventory=1,dig_immediate=3},
	--post_effect_color = {a = 10, r = 0, g = 0, b = 0},
})

minetest.register_alias("default:blackout", "lord_blocks:blackout")

minetest.register_node(":lottblocks:dwarfstone_stripe_singledot", {
	description       = S("Stripe Dwarf Stone (Single Dot)"),
	tiles             = {
		"lottblocks_dwarfstone_stripe_singledot_top.png",
		"lottblocks_dwarfstone_stripe_singledot_bottom.png",
		"default_stone.png",
		"lottblocks_dwarfstone_stripe_l.png",
		"lottblocks_dwarfstone_stripe_r.png",
		"default_stone.png",
	},
	paramtype2        = "facedir",
	is_ground_content = false,
	groups            = { cracky = 3 },
})

minetest.register_node(":lottblocks:dwarfstone_stripe_onesided", {
	description       = S("Stripe Dwarf Stone (One Sided)"),
	tiles             = {
		"lottblocks_dwarfstone_stripe_onesided_top.png",
		"lottblocks_dwarfstone_stripe_onesided_bottom.png",
		"lottblocks_dwarfstone_stripe_r.png",
		"lottblocks_dwarfstone_stripe_l.png",
		"lottblocks_dwarfstone_stripe_double.png",
		"default_stone.png",
	},
	paramtype2        = "facedir",
	is_ground_content = false,
	groups            = { cracky = 3 },
})


minetest.register_craft({
	output = 'lottblocks:dwarfstone_stripe 4',
	recipe = {
		{ 'default:coal_lump', 'default:stone' },
		{ 'default:coal_lump', 'default:stone' },
	}
})

minetest.register_craft({
	output = 'lottblocks:dwarfstone_stripe_singledot 8',
	recipe = {
		{ 'default:stone', 'default:stone', 'default:coal_lump' },
		{ 'default:stone', 'default:stone', '' },
	}
})

minetest.register_craft({
	output = 'lottblocks:dwarfstone_stripe_singledot 8',
	recipe = {
		{ 'default:coal_lump', 'default:stone', 'default:stone' },
		{ '', 'default:stone', 'default:stone' },
	}
})

minetest.register_craft({
	output = 'lottblocks:dwarfstone_stripe_onesided 4',
	recipe = {
		{ 'default:coal_lump', 'default:stone', 'default:coal_lump' },
		{ 'default:coal_lump', 'default:stone', 'default:coal_lump' },
	}
})


-- Marble with gold and gems

minetest.register_node("lord_blocks:marble_with_gold", {
	description = S("Marble With Gold"),
	tiles = {"lottores_marble.png^lord_blocks_edging_gold.png"},
	is_ground_content = true,
	groups = {cracky=3},
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("lord_blocks:marble_with_redgem", {
	description = S("Marble With Redgem"),
	tiles = {"lottores_marble.png^lord_blocks_edging_gold.png^lord_blocks_redgem.png"},
	is_ground_content = true,
	groups = {cracky=3},
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("lord_blocks:marble_with_bluegem", {
	description = S("Marble With Bluegem"),
	tiles = {"lottores_marble.png^lord_blocks_edging_gold.png^lord_blocks_bluegem.png"},
	is_ground_content = true,
	groups = {cracky=3},
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("lord_blocks:marble_with_purplegem", {
	description = S("Marble With Purplegem"),
	tiles = {"lottores_marble.png^lord_blocks_edging_gold.png^lord_blocks_purplegem.png"},
	is_ground_content = true,
	groups = {cracky=3},
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_craft({
	output = 'lord_blocks:marble_with_gold',
	recipe = {
		{ 'default:gold_ingot', 'default:gold_ingot', 'default:gold_ingot' },
		{ 'default:gold_ingot', 'lottores:marble', 'default:gold_ingot' },
		{ 'default:gold_ingot', 'default:gold_ingot', 'default:gold_ingot' },
	}
})

minetest.register_craft({
	type = "shapeless",
	output = 'lord_blocks:marble_with_redgem',
	recipe = {'lord_blocks:marble_with_gold', 'lottores:red_gem'}
})

minetest.register_craft({
	type = "shapeless",
	output = 'lord_blocks:marble_with_bluegem',
	recipe = {'lord_blocks:marble_with_gold', 'lottores:blue_gem'}
})

minetest.register_craft({
	type = "shapeless",
	output = 'lord_blocks:marble_with_purplegem',
	recipe = {'lord_blocks:marble_with_gold', 'lottother:purple_gem'}
})

minetest.register_node("lord_blocks:green_marble", {
	description = S("Green Marble"),
	tiles = {"lord_blocks_green_marble.png"},
	is_ground_content = true,
	groups = {cracky=3, stone=1},
	sounds = default.node_sound_stone_defaults(),
})

stairs.register_stair_and_slab(
	"green_marble",
	"lord_blocks:green_marble",
	{cracky=3},
	{"lord_blocks_green_marble.png"},
	S("Green Marble Stair"),
	S("Green Marble Slab"),
	default.node_sound_stone_defaults(),
	false,
	S("Inner Green Marble Stair"),
	S("Outer Green Marble Stair")
)
