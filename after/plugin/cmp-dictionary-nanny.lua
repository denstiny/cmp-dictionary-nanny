-- @author      : aero (2254228017@qq.com)
-- @file        : cmp-lang-nanny
-- @created     : 星期五 3月 10, 2023 19:36:52 CST
-- @github      : https://github.com/denstiny
-- @blog        : https://denstiny.github.io

local cmp = require("cmp")
local source = require("cmp-dictionary-nanny.source")
cmp.register_source("cmp-dictionary-nanny", source.new())
