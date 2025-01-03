local S = minetest.get_mod_translator()


minetest.register_tool("lottblocks:lockpick", {
	description     = S("Lockpick"),
	inventory_image = "lottblocks_steel_lockpick.png", --Made by HeroOfTheWinds
	--https://github.com/HeroOfTheWinds/lockpicks/blob/master/textures/steel_lockpick.png
	max_stack       = 1,
})

minetest.register_craft({
	output = "lottblocks:lockpick",
	recipe = {
		{ "", "default:steel_ingot", "" },
		{ "", "default:steel_ingot", "default:steel_ingot" },
		{ "", "group:stick", "" }
	}
})

--- Обработчик отмычки
--- Проверяет, срабатывает ли отмычка.
---@param itemstack ItemStack стак, содержащий отмычку;
---@param player string имя игрока, использующего отмычку.
---@return boolean сработало или нет.
function lottblocks.lockpick_can_break_in(itemstack, player)
	itemstack:add_wear(65535 / 20)
	if math.random(1, 4) ~= 3 then
		minetest.chat_send_player(player, S("Lockpick failed"))
		return false
	else
		return true
	end
end


--- Регистрация "расового" сундука
---@param name string @название ноды;
---@param desc string @описание ноды;
---@param tiles table @тайлы ноды;
---@param owner_race string @раса, которая может открывать сундук;
---@param background string @текстура фона сундука;
local function register_race_chest(name, desc, tiles, owner_race, background)
	minetest.register_node(name, {
		description           = desc,
		tiles                 = tiles,
		paramtype2            = "facedir",
		groups                = { choppy = 2, oddly_breakable_by_hand = 2, wooden = 1, smallchest = 1 },
		legacy_facedir_simple = true,
		is_ground_content     = false,
		sounds                = default.node_sound_wood_defaults(),
		on_construct          = function(pos, node, active_object_count, active_object_count_wider)
			local meta = minetest.get_meta(pos)
			meta:set_string("infotext", desc)
			local inv = meta:get_inventory()
			inv:set_size("main", 8 * 4)
		end,
		on_rightclick         = function(pos, node, clicker, itemstack)
			local player = clicker:get_player_name()
			local opened, expected_race = races.can_open_stuff(owner_race, player, itemstack)
			if opened then
				minetest.show_formspec(player, name, default.chest.get_chest_formspec(pos, background))
			elseif expected_race ~= nil then
				minetest.chat_send_player(player, S("Only @1 can open this kind of chest!", expected_race))
			end
		end,
		can_dig               = function(pos, player)
			local meta = minetest.get_meta(pos)
			local inv  = meta:get_inventory()
			return inv:is_empty("main")
		end,
		on_punch              = function(pos, player)
			local meta = minetest.get_meta(pos)
			meta:set_string("infotext", name)
			meta:set_string("formspec", "")
		end,
	})
end

register_race_chest("lottblocks:hobbit_chest", S("Hobbit Chest"),
	{
		"lottblocks_hobbit_chest_top.png", "lottblocks_hobbit_chest_bottom.png", "lottblocks_hobbit_chest_side.png",
		"lottblocks_hobbit_chest_side.png", "lottblocks_hobbit_chest_side.png", "lottblocks_hobbit_chest_front.png",
	},
	"hobbit", "gui_hobbitbg.png")

register_race_chest("lottblocks:gondor_chest", S("Gondorian Chest"),
	{
		"lottblocks_gondor_chest_top.png", "lottblocks_gondor_chest_bottom.png", "lottblocks_gondor_chest_side.png",
		"lottblocks_gondor_chest_side.png", "lottblocks_gondor_chest_side.png", "lottblocks_gondor_chest_front.png",
	},
	"man", "gui_gondorbg.png")

register_race_chest("lottblocks:rohan_chest", S("Rohirrim Chest"),
	{
		"lottblocks_rohan_chest_top.png", "lottblocks_rohan_chest_bottom.png", "lottblocks_rohan_chest_side.png",
		"lottblocks_rohan_chest_side.png", "lottblocks_rohan_chest_side.png", "lottblocks_rohan_chest_front.png",
	},
	"man", "gui_rohanbg.png")

register_race_chest("lottblocks:elfloth_chest", S("Elven (Lorien) Chest"),
	{
		"lottblocks_elf_chest_top.png", "lottblocks_elf_chest_bottom.png", "lottblocks_elf_chest_side.png",
		"lottblocks_elf_chest_side.png", "lottblocks_elf_chest_side.png", "lottblocks_elf_chest_front.png",
	},
	"elf", "gui_elfbg.png")

register_race_chest("lottblocks:elfmirk_chest", S("Elven (Mirkwood) Chest"),
	{
		"lottblocks_elf_chest_top.png", "lottblocks_elf_chest_bottom.png", "lottblocks_elf_chest_side.png",
		"lottblocks_elf_chest_side.png", "lottblocks_elf_chest_side.png", "lottblocks_elf_chest_front.png",
	},
	"elf", "gui_elfbg.png")

register_race_chest("lottblocks:mordor_chest", S("Mordor Chest"),
	{
		"lottblocks_mordor_chest_top.png", "lottblocks_mordor_chest_bottom.png", "lottblocks_mordor_chest_side.png",
		"lottblocks_mordor_chest_side.png", "lottblocks_mordor_chest_side.png", "lottblocks_mordor_chest_front.png",
	},
	"orc", "gui_mordorbg.png")

register_race_chest("lottblocks:angmar_chest", S("Angmar Chest"),
	{
		"lottblocks_angmar_chest_top.png", "lottblocks_angmar_chest_bottom.png", "lottblocks_angmar_chest_side.png",
		"lottblocks_angmar_chest_side.png", "lottblocks_angmar_chest_side.png", "lottblocks_angmar_chest_front.png",
	},
	"orc", "gui_angmarbg.png")

register_race_chest("lottblocks:dwarf_chest", S("Dwarf Chest"),
	{
        "lottblocks_dwarf_chest_top.png", "lottblocks_dwarf_chest_bottom.png", "lottblocks_dwarf_chest_side.png",
		"lottblocks_dwarf_chest_side.png", "lottblocks_dwarf_chest_side.png", "lottblocks_dwarf_chest_front.png"
	},
	"dwarf", "gui_dwarfbg.png")

minetest.register_craft({
	output = "lottblocks:hobbit_chest",
	recipe = {
		{ "lord_planks:birch", "lord_planks:birch", "lord_planks:birch" },
		{ "lord_planks:birch", "", "lord_planks:birch" },
		{ "lord_planks:birch", "lord_planks:birch", "lord_planks:birch" },
	}
})

minetest.register_craft({
	output = "lottblocks:gondor_chest",
	recipe = {
		{ "lord_planks:alder", "lord_planks:alder", "lord_planks:alder" },
		{ "lord_planks:alder", "", "lord_planks:alder" },
		{ "lord_planks:alder", "lord_planks:alder", "lord_planks:alder" },
	}
})

minetest.register_craft({
	output = "lottblocks:rohan_chest",
	recipe = {
		{ "lord_planks:lebethron", "lord_planks:lebethron", "lord_planks:lebethron" },
		{ "lord_planks:lebethron", "", "lord_planks:lebethron" },
		{ "lord_planks:lebethron", "lord_planks:lebethron", "lord_planks:lebethron" },
	}
})

minetest.register_craft({
	output = "lottblocks:elfloth_chest",
	recipe = {
		{ "lord_planks:mallorn", "lord_planks:mallorn", "lord_planks:mallorn" },
		{ "lord_planks:mallorn", "", "lord_planks:mallorn" },
		{ "lord_planks:mallorn", "lord_planks:mallorn", "lord_planks:mallorn" },
	}
})

minetest.register_craft({
	output = "lottblocks:elfmirk_chest",
	recipe = {
		{ "default:junglewood", "default:junglewood", "default:junglewood" },
		{ "default:junglewood", "", "default:junglewood" },
		{ "default:junglewood", "default:junglewood", "default:junglewood" },
	}
})

minetest.register_craft({
	output = "lottblocks:mordor_chest",
	recipe = {
		{ "lord_rocks:mordor_stone", "lord_rocks:mordor_stone", "lord_rocks:mordor_stone" },
		{ "lord_rocks:mordor_stone", "", "lord_rocks:mordor_stone" },
		{ "lord_rocks:mordor_stone", "lord_rocks:mordor_stone", "lord_rocks:mordor_stone" },
	}
})

minetest.register_craft({
	output = "lottblocks:angmar_chest",
	recipe = {
		{ "lord_planks:pine", "lord_planks:pine", "lord_planks:pine" },
		{ "lord_planks:pine", "", "lord_planks:pine" },
		{ "lord_planks:pine", "lord_planks:pine", "lord_planks:pine" },
	}
})

minetest.register_craft({
	output = "lottblocks:dwarf_chest",
	recipe = {
		{"default:stone", "default:stone", "default:stone"},
		{"default:stone", "default:chest", "default:stone"},
		{"default:stone", "default:stone", "default:stone"},
	}
})

minetest.register_alias("lottmapgen:hobbit_chest", "lottblocks:hobbit_chest")
minetest.register_alias("lottmapgen:gondor_chest", "lottblocks:gondor_chest")
minetest.register_alias("lottmapgen:rohan_chest", "lottblocks:rohan_chest")
minetest.register_alias("lottmapgen:elfloth_chest", "lottblocks:elfloth_chest")
minetest.register_alias("lottmapgen:elfmirk_chest", "lottblocks:elfmirk_chest")
minetest.register_alias("lottmapgen:mordor_chest", "lottblocks:mordor_chest")
minetest.register_alias("lottmapgen:angmar_chest", "lottblocks:angmar_chest")
