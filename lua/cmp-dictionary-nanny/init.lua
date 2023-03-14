-- @author      : aero (2254228017@qq.com)
-- @file        : init
-- @created     : 星期五 3月 10, 2023 19:46:19 CST
-- @github      : https://github.com/denstiny
-- @blog        : https://denstiny.github.io

local M = {}
local cmp = require("cmp")
local config = require("cmp-dictionary-nanny.config")

M.setup = function()
	vim.schedule(function()
		local path = config:get("database_path")
		local url = config:get("database_url")
		require("cmp-dictionary-nanny.download").download(path, url)
		local source = require("cmp-dictionary-nanny.source")
		cmp.register_source("cmp-dictionary-nanny", source.new())
		local auto_group = vim.api.nvim_create_namespace("cmp-dictionary-nanny")
		vim.api.nvim_create_autocmd({ "VimLeavePre" }, {
			group = auto_group,
			callback = function()
				source.close()
			end,
		})
	end)
end
return M
