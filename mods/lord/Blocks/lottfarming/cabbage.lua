local S = minetest.get_mod_translator()

minetest.register_craftitem("lottfarming:cabbage_seed", {
	description     = S("Cabbage Seed"),
	inventory_image = "lottfarming_cabbage_seed.png",
	on_place        = function(itemstack, placer, pointed_thing)
		local ptu = pointed_thing.under
		local nu  = minetest.get_node(ptu)
		if minetest.registered_nodes[nu.name].on_rightclick then
			return minetest.registered_nodes[nu.name].on_rightclick(ptu, nu, placer, itemstack)
		end
		return place_seed(itemstack, placer, pointed_thing, "lottfarming:cabbage_1")
	end,
})

minetest.register_node("lottfarming:cabbage_1", {
	paramtype           = "light",
	sunlight_propagates = true,
	drawtype            = "nodebox",
	drop                = "",
	tiles               = {
		"lottfarming_cabbage_top.png",
		"lottfarming_cabbage_top.png",
		"lottfarming_cabbage_side.png",
		"lottfarming_cabbage_side.png",
		"lottfarming_cabbage_side.png",
		"lottfarming_cabbage_side.png",
	},
	node_box            = {
		type  = "fixed",
		fixed = {
			{ -0.2, -0.5, -0.2, 0.2, -0.1, 0.2 }
		},
	},
	selection_box       = {
		type  = "fixed",
		fixed = {
			{ -0.2, -0.5, -0.2, 0.2, -0.1, 0.2 }
		},
	},
	groups              = {
		choppy                    = 2,
		oddly_breakable_by_hand   = 2,
		flammable                 = 2,
		not_in_creative_inventory = 1,
		plant                     = 1,
	},
	sounds              = default.node_sound_wood_defaults(),
})

minetest.register_node("lottfarming:cabbage_2", {
	paramtype           = "light",
	sunlight_propagates = true,
	drawtype            = "nodebox",
	drop                = "",
	tiles               = {
		"lottfarming_cabbage_top.png",
		"lottfarming_cabbage_top.png",
		"lottfarming_cabbage_side.png",
		"lottfarming_cabbage_side.png",
		"lottfarming_cabbage_side.png",
		"lottfarming_cabbage_side.png",
	},
	node_box            = {
		type  = "fixed",
		fixed = {
			{ -0.35, -0.5, -0.35, 0.35, 0.2, 0.35 }
		},
	},
	selection_box       = {
		type  = "fixed",
		fixed = {
			{ -0.35, -0.5, -0.35, 0.35, 0.2, 0.35 }
		},
	},
	groups              = {
		choppy                    = 2,
		oddly_breakable_by_hand   = 2,
		flammable                 = 2,
		not_in_creative_inventory = 1,
		plant                     = 1,
	},
	sounds              = default.node_sound_wood_defaults(),
})

minetest.register_node("lottfarming:cabbage_3", {
	description = S("Cabbage"),
	paramtype2  = "facedir",
	tiles       = {
		"lottfarming_cabbage_top.png",
		"lottfarming_cabbage_top.png",
		"lottfarming_cabbage_side.png",
		"lottfarming_cabbage_side.png",
		"lottfarming_cabbage_side.png",
		"lottfarming_cabbage_side.png",
	},
	drop        = {
		max_items = 6,
		items     = {
			{ items = { 'lottfarming:cabbage_seed' } },
			{ items = { 'lottfarming:cabbage_seed' }, rarity = 2 },
			{ items = { 'lottfarming:cabbage_seed' }, rarity = 5 },
			{ items = { 'lottfarming:cabbage' } },
			{ items = { 'lottfarming:cabbage' }, rarity = 2 },
			{ items = { 'lottfarming:cabbage' }, rarity = 5 }
		}
	},
	groups      = { choppy = 2, oddly_breakable_by_hand = 2, flammable = 2, plant = 1 },
	sounds      = default.node_sound_wood_defaults(),
})

minetest.register_node("lottfarming:cabbage", {
	description = S("Cabbage"),
	paramtype2  = "facedir",
	tiles       = {
		"lottfarming_cabbage_top.png",
		"lottfarming_cabbage_top.png",
		"lottfarming_cabbage_side.png",
		"lottfarming_cabbage_side.png",
		"lottfarming_cabbage_side.png",
		"lottfarming_cabbage_side.png",
	},
	groups      = { choppy = 2, oddly_breakable_by_hand = 2, flammable = 2, plant = 1, salad = 1 },
	sounds      = default.node_sound_wood_defaults(),
	on_use      = minetest.item_eat(5),
	_tt_food_hp = 5,
})

farming:add_plant("lottfarming:cabbage_3", { "lottfarming:cabbage_1", "lottfarming:cabbage_2" }, 80, 20)

minetest.register_craftitem("lottfarming:salad", {
	description     = S("Salad"),
	inventory_image = "lottfarming_salad.png",
	on_use          = minetest.item_eat(14),
	_tt_food_hp     = 14,
})
