local S = minetest.get_mod_translator()

minetest.register_craftitem("bones:bonedust", {
	description = S("Bone Dust"),
	inventory_image = "bones_bonedust.png",
	liquids_pointable = false,
	stack_max = 99,
})

minetest.register_craftitem("bones:bone", {
	description = S("Bone"),
	inventory_image = "bones_bone.png",
})

minetest.register_tool("bones:bone_scythe", {
	description = S("Bone Scythe"),
	inventory_image = "bones_scythe.png",
	range = 7,
	tool_capabilities = {
		full_punch_interval = 1.5,
		max_drop_level=1,
		groupcaps={
			snappy={times={[1]=2.0, [2]=1.00, [3]=0.35}, uses=30, maxlevel=3},
		},
		damage_groups = {fleshy=4},
	}
})
