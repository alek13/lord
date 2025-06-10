local debug_getinfo
	= debug.getinfo

--- @param depth number
--- @return string
function __FILE__(depth) -- luacheck: ignore unused global variable __FILE__
	return debug_getinfo(2 + (depth or 0), 'S').source
end
--- @param depth number
--- @return number
function __LINE__(depth) -- luacheck: ignore unused global variable __LINE__
	return debug_getinfo(2 + (depth or 0), 'l').currentline
end
--- @param depth number
--- @return string
function __FILE_LINE__(depth) -- luacheck: ignore unused global variable __FILE_LINE__
	depth = depth or 0
	return __FILE__(depth + 1) .. ':' .. __LINE__(depth + 1)
end
--- @param depth number
--- @return string
function __FUNC__(depth)  -- luacheck: ignore unused global variable __FUNC__
	return debug_getinfo(2 + (depth or 0), 'n').name
end

--- Shorten for `print(dump(...))`
--- @overload fun(any:any)
--- @param any    any
--- @param dumped table
function pd(any, dumped) -- luacheck: ignore unused global variable pd
	print(dump(any, dumped))
end

--- @param func function
--- @return string
function debug.get_function_code(func)
	local func_info = debug.getinfo(func)
	local name = func_info.source:gsub("^@","")
	local i    = 0
	local code = {}
	for line in io.lines(name) do
		i=i+1
		if i >= func_info.linedefined then code[#code +1] = line end
		if i >= func_info.lastlinedefined then break end
	end

	return table.concat(code,"\n")
end
