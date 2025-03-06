
return {
	rocks = {
		-- name = {softness, definition},
		["lord_rocks:diorite"]        = { softness = 1, definition = {} },
		["lord_rocks:granite"]        = { softness = 1, definition = {} },
		["lord_rocks:basalt"]         = { softness = 2, definition = {} },
		["lord_rocks:andesite"]       = { softness = 2, definition = {} },
		["lord_rocks:peridotite"]     = { softness = 1, definition = {} },
		["lord_rocks:grey_tuff"]      = { softness = 3, definition = {} },
		["lord_rocks:red_tuff"]       = { softness = 3, definition = {} },
		["lord_rocks:white_tuff"]     = { softness = 3, definition = {} },
		["lord_rocks:grey_quartzite"] = { softness = 2, definition = {} },
		["lord_rocks:pink_quartzite"] = { softness = 2, definition = {} },
		["lord_rocks:shale"]          = { softness = 3, definition = {} },
		["lord_rocks:pyroxenite"]     = { softness = 1, definition = {} },
		["lord_rocks:frozen_stone"]   = { softness = 3, definition = {
			tiles = { "default_stone.png^lord_rocks_frozen.png" },
		}, not_rock = true },
		["lord_rocks:mordor_stone"] = { softness = 3, definition = {
			drop = "lottmapgen:mordor_cobble",
		} },
	},
	--- @type minetest.CraftRecipe[]
	additional_crafts = {
		{
			output = "lord_rocks:frozen_stone 2",
			recipe = {
				{ "default:ice", "default:stone" },
				{ "default:stone", "default:ice" },
			},
		},
	},
}
