local S = minetest.get_translator("lottplants")


local saplings = {
	--- @type table<string,NodeDefinition>|NodeDefinition[]
	nodes = {}
}

--- @param node_name string technical node name ("<mod>:<node>").
local function add_existing(node_name)
	local definition = minetest.registered_nodes[node_name]
	minetest.override_item(node_name, {
		groups = table.overwrite(definition.groups, { sapling = 1 }),
	})
	saplings.nodes[node_name] = definition
end

local function register_sapling(node_name, title)
	title         = title:first_to_upper()
	local texture = node_name:replace(":", "_") .. ".png"
	-- bin/minetest --info 2>&1 | grep 'use texture'
	minetest.log("info", "use texture: " .. texture .. " at " .. __FILE_LINE__())

	minetest.register_node(node_name, {
		description     = S(title),
		drawtype        = "plantlike",
		visual_scale    = 1.0,
		tiles           = { texture },
		inventory_image = texture,
		wield_image     = texture,
		paramtype       = "light",
		waving          = 1,
		walkable        = false,
		selection_box     = {
			type  = "fixed",
			fixed = { -0.2, -0.5, -0.2, 0.2, 0.3, 0.2 },
		},
		groups          = { snappy = 2, dig_immediate = 3, flammable = 2, sapling = 1 },
		sounds          = default.node_sound_defaults(),
	})

	saplings.nodes[node_name] = minetest.registered_nodes[node_name]
end

register_sapling("lottplants:aldersapling", "Alder Sapling")
register_sapling("lottplants:applesapling", "Apple Tree Sapling")
register_sapling("lottplants:birchsapling", "Birch Sapling")
register_sapling("lottplants:beechsapling", "Beech Sapling")
register_sapling("lottplants:culumaldasapling", "Culumalda Sapling")
register_sapling("lottplants:elmsapling", "Elm Sapling")
register_sapling("lottplants:firsapling", "Fir Sapling")
register_sapling("lottplants:lebethronsapling", "Lebethron Sapling")
register_sapling("lottplants:mallornsapling", "Mallorn Sapling")
register_sapling("lottplants:pinesapling", "Pine Sapling")
register_sapling("lottplants:plumsapling", "Plum Tree Sapling")
register_sapling("lottplants:rowansapling", "Rowan Sapling")
register_sapling("lottplants:whitesapling", "White Tree Sapling")
register_sapling("lottplants:yavannamiresapling", "Yavannamire Sapling")
register_sapling("lottplants:mirksapling", "Mirkwood Sapling")

return {
	add_existing = add_existing,
	register     = register_sapling,
	get_nodes    = function() return saplings.nodes end
}
