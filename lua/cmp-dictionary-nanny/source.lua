-- @author      : aero (2254228017@qq.com)
-- @file        : source
-- @created     : 星期五 3月 10, 2023 19:47:14 CST
-- @github      : https://github.com/denstiny
-- @blog        : https://denstiny.github.io

local source = {
	job = 0,
	pending = {},
}
local utils = {}
local conf = require("cmp-dictionary-nanny.config")

function source:is_available()
	return true
end

function source:get_debug_name()
	return "Dictionary nanny"
end

function source.complete(self, ctx, callback)
	if conf:get("ignored_file_types")[vim.bo.filetype] then
		callback()
		return
	end
	self.pending[ctx.context.id] = { ctx = ctx, callback = callback, job = self.job }
	self:_do_complete(ctx)
end

function source._do_complete(self, ctx)
	if self.job == 0 then
		return
	end
	-- TODO
end

local last_instance = nil

source.new = function()
	last_instance = setmetatable({}, { __index = source })
	last_instance:on_exit(0)
	return last_instance
end

source.on_exit = function(self, job, code)
	-- TODO
end

source.on_stdout = function(self, data)
	-- TODO
end

utils.parent_dir = function(path)
	local pattern = "^(.+)/"
	path = path:gsub("/*$", "")
	local parent_dir = path:match(pattern) .. "/"
	return parent_dir
end

utils.get_current_dir = function()
	local str = debug.getinfo(2, "S").source:sub(2)
	return str:match("(.*/)")
end

utils.root_dir = function()
	local root = utils.parent_dir(utils.parent_dir(utils.get_current_dir()))
	return root
end

--- get server binary path
utils.binary = function()
	return root_dir() .. "/server/build/dict"
end

return source
