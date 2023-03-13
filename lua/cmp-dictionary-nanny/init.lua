-- @author      : aero (2254228017@qq.com)
-- @file        : init
-- @created     : 星期五 3月 10, 2023 19:46:19 CST
-- @github      : https://github.com/denstiny
-- @blog        : https://denstiny.github.io

local cmp = require("cmp")
local source = require("cmp-dictionary-nanny.source")
local M = {}

M.setup = function()
	M.cmp_source = source:new()
	cmp.register_source("cmp-dictionary-nanny", M.cmp_source)
end
return M
