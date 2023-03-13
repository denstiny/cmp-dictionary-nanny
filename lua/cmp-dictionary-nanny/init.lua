-- @author      : aero (2254228017@qq.com)
-- @file        : init
-- @created     : 星期五 3月 10, 2023 19:46:19 CST
-- @github      : https://github.com/denstiny
-- @blog        : https://denstiny.github.io

local M = {}
local config = require("cmp-dictionary-nanny.config")
M.setup = function(opt)
	config.setup(opt)
	local path = config:get("database_path")
	local url = config:get("database_url")
	require("cmp-dictionary-nanny.download").download(path, url)
end
return M
