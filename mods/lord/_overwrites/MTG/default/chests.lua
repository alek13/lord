local spec = minetest.formspec

default.chest.get_chest_formspec = function(pos)
	local spos     = pos.x .. "," .. pos.y .. "," .. pos.z

	local formspec = ''
		.. spec.size(8, 9)
		.. spec.background(-.8, -1, 1, 1, 'default_chest_form-icon.png')
		.. spec.list("nodemeta:" .. spos, 'main', 0, 0.3, 8, 4)
		.. spec.list('current_player', 'main', 0, 4.85, 8, 1)
		.. spec.list('current_player', 'main', 0, 6.08, 8, 3, 8)
		.. spec.listring('nodemeta:' .. spos, 'main')
		.. spec.listring('current_player', 'main')
		.. default.get_hotbar_bg(0, 4.85)

	return formspec
end
