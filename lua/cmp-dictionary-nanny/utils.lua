local utils = {}

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
return utils
