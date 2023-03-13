-- @author      : aero (2254228017@qq.com)
-- @file        : source
-- @created     : 星期五 3月 10, 2023 19:47:14 CST
-- @github      : https://github.com/denstiny
-- @blog        : https://denstiny.github.io

local utils = {}
local conf = require("cmp-dictionary-nanny.config")
local notify = require("cmp-dictionary-nanny.notify")
local fn = vim.fn

local source = {
	job = 0,
	pending = {},
}

function source:is_available()
	return true
end

function source:get_debug_name()
	return "Dictionary nanny"
end

function source.complete(self, ctx, callback)
	--if conf:get("ignored_file_types")[vim.bo.filetype] then
	--	callback()
	--	return
	--end
	self.pending[ctx.context.id] = { ctx = ctx, callback = callback, job = self.job }
	self:_do_complete(ctx)
end

function source._do_complete(self, ctx)
	vim.notify("as")
	if self.job == 0 then
		return
	end
	local max_num_results = conf:get("max_num_results")
	local cursor = ctx.context.cursor
	local cur_line = ctx.context.cursor_line
	local cur_line_before = string.sub(cur_line, 1, cursor.col - 1)
	local cur_line_after = string.sub(cur_line, cursor.col) -- include current character
	local req = {
		correlation_id = ctx.context.id,
		table_name = conf:get("table_name"),
		filter = cur_line,
	}
	--req.pcall(fn.chansend, self.job, fn.json_encode(req) .. "\n")
end

local last_instance = nil

source.new = function()
	vim.notify("as")
	last_instance = setmetatable({}, { __index = source })
	last_instance:on_exit(0)
	return last_instance
end

local function json_decode(data)
	local status, result = pcall(vim.fn.json_decode, data)
	if status then
		return result
	else
		return nil, result
	end
end

source.on_exit = function(self, job, code)
	if job ~= self.job then
		return
	end

	if code == 143 then
		-- nvim is exiting. do not restart
		return
	end
	self.pending = {}
	local bin = utils.binary()
	self.job = fn.jobstart({ bin }, {
		on_stderr = function(_, data, _)
			notify(data)
		end,
		on_exit = function(j, c, _)
			self:on_exit(j, c)
		end,
		on_stdout = function(_, data, _)
			self:on_stdout(data)
		end,
	})
end

source.on_stdout = function(self, data)
	vim.notify(data)
	for _, jd in ipairs(data) do
		if jd ~= nil and jd ~= "" and jd ~= "null" then
			local response = (json_decode(jd) or {})
			local id = response.correlation_id
			local callback = self.pending[id].callback
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
	end
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

utils.home_dir = function()
	local root = utils.parent_dir(utils.parent_dir(utils.get_current_dir()))
	return root
end

--- get server binary path
utils.binary = function()
	return utils.home_dir() .. "/server/build/dict_server"
end

return source
