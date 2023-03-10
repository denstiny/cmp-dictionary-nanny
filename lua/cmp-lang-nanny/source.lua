-- @author      : aero (2254228017@qq.com)
-- @file        : source
-- @created     : 星期五 3月 10, 2023 19:47:14 CST
-- @github      : https://github.com/denstiny
-- @blog        : https://denstiny.github.io

local source = {}

---Return whether this source is available in the current context or not (optional).
---@return boolean
function source:is_available()
	return true
end

---Invoke completion (required).
---@param params cmp.SourceCompletionApiParams
---@param callback fun(response: lsp.CompletionResponse|nil)
function source:complete(params, callback)
	callback({
		{ label = "January" },
		{ label = "February" },
		{ label = "March" },
		{ label = "April" },
		{ label = "May" },
		{ label = "June" },
		{ label = "July" },
		{ label = "August" },
		{ label = "September" },
		{ label = "October" },
		{ label = "November" },
		{ label = "December" },
	})
end

local function parent_dir(path)
	local pattern = "^(.+)/"
	path = path:gsub("/*$", "")
	local parent_dir = path:match(pattern) .. "/"
	return parent_dir
end

local function get_current_dir()
	local str = debug.getinfo(2, "S").source:sub(2)
	return str:match("(.*/)")
end

local function root_dir()
	local root = parent_dir(parent_dir(get_current_dir()))
	return root
end

--- get server binary path
local function binary()
	return root_dir() .. "/server/build/dict"
end

return source
