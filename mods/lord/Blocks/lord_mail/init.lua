local S        = minetest.get_mod_translator()
local colorize = minetest.colorize
local e        = minetest.formspec.escape
local spec     = forms.Spec

local text_color = "#000"

local mail = {}

mail.change_owner = function(meta, name)
	if name ~= "" and name ~= nil then
		meta:set_string("owner", name)
		meta:set_string("infotext", S("Mail for").." "..name)
	end
end

-- mail Interface
-- mail chest

mail.get_output_formspec = function(meta,pos,owner)
	local spos = pos.x .. "," .. pos.y .. "," ..pos.z
	local formspec =
		"size[8,9]"..
		"list[nodemeta:".. spos .. ";main;0,0;8,4;]"..
		"list[current_player;main;0,5;8,4;]"..
		"listring[nodemeta:".. spos .. ";main]"..
		"listring[current_player;main]"

		if minetest.check_player_privs(owner, {privs = true}) then
			formspec = formspec .. "field[2.34,4.34;3,1;mail_change_owner;;".. owner .."]"..
			"button_exit[5,4;1,1;btn_ok;OK]"
		end
	return formspec
end

mail.get_input_formspec = function(meta,pos,name)
	local spos = pos.x .. "," .. pos.y .. "," ..pos.z
	local formspec =
		"size[8,9]"..
		"list[nodemeta:".. spos .. ";drop;3.5,2;1,1;]"..
		"list[current_player;main;0,5;8,4;]"

		if minetest.check_player_privs(name, {privs = true}) then
			formspec = formspec .. "field[2.34,4.34;3,1;mail_change_owner;;".. name .."]"..
			"button_exit[5,4;1,1;btn_ok;OK]"
		end

	return formspec
end

-- Обработка событий формы
minetest.register_on_player_receive_fields(function(player, formname, fields)

	local name = player:get_player_name()

	-- TODO: string:startsWith into Core/helpers
	if string.sub(formname, 0, string.len("lord_mail:mail_chest_")) == "lord_mail:mail_chest_" then

		local pos_s = string.sub(formname, string.len("lord_mail:mail_chest_") + 7)
		local pos = minetest.string_to_pos(pos_s)
		local meta = minetest.get_meta(pos)

		if minetest.check_player_privs(name, {privs = true}) then
			if fields.btn_ok then -- кнопка Ok
				local owner = fields.mail_change_owner

				if fields.mail_change_owner then
					mail.change_owner(meta, owner)
				end
			end
		end
	end
end)

minetest.register_node("lord_mail:mail_chest", {
	description = S("Mail Chest"),
	tiles = {"mail_chest_top.png", "default_chest_top.png", "mail_chest_side.png",
		"mail_chest_side.png", "mail_chest_side.png", "mail_chest_front.png"},
	paramtype = "light",
	paramtype2 = "facedir",
	is_ground_content = false,
	sounds = default.node_sound_wood_defaults(),
	groups = {choppy=2,oddly_breakable_by_hand=2,wooden=1},
	after_place_node = function(pos, placer, itemstack)
		local meta = minetest.get_meta(pos)
		local owner = placer:get_player_name()
		meta:set_string("owner", owner)
		meta:set_string("infotext", S("Mail for").." "..owner)
		local inv = meta:get_inventory()
		inv:set_size("main", 8*4)
		inv:set_size("drop", 1)
	end,
	on_rightclick = function(pos, node, clicker, itemstack)
		local meta = minetest.get_meta(pos)
		local player = clicker:get_player_name()
		local owner  = meta:get_string("owner")
		if
			owner == player or
			(minetest.check_player_privs(clicker, "server") and not clicker:get_player_control().aux1)
		then
			minetest.show_formspec(
				clicker:get_player_name(),
				"lord_mail:mail_chest_output" .. minetest.pos_to_string(pos),
				mail.get_output_formspec(meta,pos,owner))
		else
			minetest.show_formspec(
				clicker:get_player_name(),
				"lord_mail:mail_chest__input" .. minetest.pos_to_string(pos),
				mail.get_input_formspec(meta,pos,player))
		end
	end,
	can_dig = function(pos,player)
		local meta = minetest.get_meta(pos);
		local owner = meta:get_string("owner")
		local inv = meta:get_inventory()
		return player:get_player_name() == owner and inv:is_empty("main")
	end,
	on_metadata_inventory_put = function(pos, listname, index, stack, player)
		local meta = minetest.get_meta(pos)
		local inv = meta:get_inventory()
		if listname == "drop" and inv:room_for_item("main", stack) then
			inv:remove_item("drop", stack)
			inv:add_item("main", stack)
		end
	end,
	allow_metadata_inventory_put = function(pos, listname, index, stack, player)
		if listname == "main" then
			return 0
		end
		if listname == "drop" then
			local meta = minetest.get_meta(pos)
			local inv = meta:get_inventory()
			if inv:room_for_item("main", stack) then
				return -1
			else
				return 0
			end
		end
	end,
})

minetest.register_craft({output = "lord_mail:mail_chest",
	recipe = {{"default:chest_locked"}},
})

-- letters
local gui_paperbg = "background[5,5;1,1;mail_paperbg.png;true]"

local function paper_on_use(itemstack, user, pointed_thing)
	local player_name = user:get_player_name()
	local data = minetest.deserialize(itemstack:get_metadata())
	local text, owner = "", player_name
	if data then
		text, owner = data.text, data.owner
	end
	local formspec
	if owner == player_name then
		formspec = "size[8,3]"..gui_paperbg..
			"style[paper_text;textcolor="..text_color.."]"..
			"field[0.5,0.5;7.5,1.0;paper_text;;"..e(text).."]"..
			"button_exit[2.5,2.0;3.0,1.0;paper_save;".. S("Save").."]"
	else
		formspec = "size[8,3]"..gui_paperbg..
			"textarea[0.5,0.3;7.5,2.0;paper_text;;"..e(text).."]"..
			"label[0.3,2.5;".. S("by").." "..owner.."]"
	end
	minetest.show_formspec(user:get_player_name(), "mail:paper", formspec)
end

-- TODO: `minetest.override_item` instead register
minetest.register_craftitem(":default:paper", {
	description = S("Paper"),
	inventory_image = "default_paper.png",
	groups = {book=1, paper=1},
	on_use = paper_on_use,
})

minetest.register_craftitem("lord_mail:paper_with_text", {
	description = S("Letter"),
	inventory_image = "mail_paper_with_text.png",
	groups = {not_in_creative_inventory=1, book=1, paper=1},
	stack_max = 1,
	on_use = paper_on_use,
})

-- books


local function book_on_use(stack, user, pointed_thing)
        local player_name = user:get_player_name()
        local meta = stack:get_meta():get_string("")
        local data = minetest.deserialize(meta)
        local title, text, owner = "", "", player_name
        if data then
                title, text, owner = data.title, data.text, data.owner
                stack:get_meta():set_string("description", S('Book')..': '..colorize('#ee8' , '"'.. title ..'"') )
                data = minetest.serialize(data)
                stack:set_metadata(data)
                user:set_wielded_item(stack)
	end
	local formspec = ''
		.. spec.size(8, 8.5)
		.. spec.image(-0.2, -0.2, 10.24, 10.4, '(lord_books_book_bg.png^[opacity:50)')

	if owner == player_name then
		formspec = formspec
			.. spec.style({ 'book_title', 'book_text' }, { textcolor = text_color})
			.. spec.bold(0.2, -0.1, S('Title'))
			.. spec.field(0.5, 1, 7.5, 0, 'book_title', '', title)
			.. spec.bold(0.2, 1.1, S('Contents'))
			.. spec.box(0.2, 1.53, 7.3, 5.9, '#fff4')
			.. spec.textarea(0.5, 1.5, 7.5, 7, 'book_text', '', text)
			.. spec.button_exit(4.7, 7.7, 3, 1, 'book_save', S('Save'))
	else
		formspec = formspec
			.. spec.label(0.2, 0, S('Title')..': '..title)
			.. spec.label(0.2, 0.5, S('by')..' '..owner)
			.. spec.box(0.125, 1.4, 7.45, 6.6, '#000')
			.. spec.textarea(0.5, 1.5, 7.5, 7.5, spec.read_only, '', text)
	end
	minetest.show_formspec(user:get_player_name(), 'mail:book', formspec)
end

-- TODO: `minetest.override_item` instead register
minetest.register_craftitem(":default:book", {
	description = S("Book"),
	inventory_image = "default_book.png",
	groups = {book=1, flammable=1},
	on_use = book_on_use,
})

minetest.register_craftitem("lord_mail:book_with_text", {
	description = S("Book With Text"),
	inventory_image = "mail_book_with_text.png",
	groups = {not_in_creative_inventory=1, book=1, flammable=1},
	stack_max = 1,
	on_use = book_on_use,
})

-- TODO: the following 2 functions seams identical
--- @param player Player
--- @param fields table
local function paper_form_handler(player, fields)
	local inv = player:get_inventory()
	local stack = player:get_wielded_item()
	local new_stack, data
	if stack:get_name() ~= "lord_mail:paper_with_text" then
		local count = stack:get_count()
		if count == 1 then
			stack:set_name("lord_mail:paper_with_text")
		else
			stack:set_count(count - 1)
			new_stack = ItemStack("lord_mail:paper_with_text")
		end
	else
		data = minetest.deserialize(stack:get_metadata())
	end
	if not data then data = {} end
	data.text = fields.paper_text
	data.owner = player:get_player_name()
	local data_str = minetest.serialize(data)
	if new_stack then
		new_stack:set_metadata(data_str)
		if inv:room_for_item("main", new_stack) then
			inv:add_item("main", new_stack)
		else
			minetest.add_item(player:get_pos(), new_stack)
		end
	else
		stack:set_metadata(data_str)
	end
	player:set_wielded_item(stack)
end

--- @param player Player
--- @param fields table
local function book_form_handler(player, fields)
	local inv = player:get_inventory()
	local stack = player:get_wielded_item()
	local new_stack, data
	if stack:get_name() ~= "lord_mail:book_with_text" then
		local count = stack:get_count()
		if count == 1 then
			stack:set_name("lord_mail:book_with_text")
		else
			stack:set_count(count - 1)
			new_stack = ItemStack("lord_mail:book_with_text")
		end
	else
		data = minetest.deserialize(stack:get_metadata())
	end
	if not data then data = {} end
	data.title = fields.book_title
	data.text = fields.book_text
	data.owner = player:get_player_name()
	local data_str = minetest.serialize(data)
	if new_stack then
		new_stack:set_metadata(data_str)
		new_stack:get_meta():set_string("description", S('Book')..': '..colorize('#ee8' , '"'.. data.title ..'"'))
		if inv:room_for_item("main", new_stack) then
			inv:add_item("main", new_stack)
		else
			minetest.add_item(player:get_pos(), new_stack)
		end
	else
		stack:set_metadata(data_str)
		stack:get_meta():set_string("description", S('Book')..': '..colorize('#ee8' , '"'.. data.title ..'"'))
	end
	player:set_wielded_item(stack)
end

-- обработка событий
minetest.register_on_player_receive_fields(function(player, form_name, fields)
	if form_name == "mail:paper" and fields.paper_save and fields.paper_text ~= "" then
		paper_form_handler(player, fields)
	end

	if form_name == "mail:book" and fields.book_save and fields.book_title ~= "" and fields.book_text ~= "" then
		book_form_handler(player, fields)
	end
end)
