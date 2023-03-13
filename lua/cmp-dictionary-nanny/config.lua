local M = {}
local conf_defaults = {
	max_num_results = 20,
	priority = 5000,
	show_prediction_strength = false,
	table_name = "stardict",
	database_path = vim.fn.stdpath("data") .. "/data/ultimate.db",
	run_on_every_keystroke = true,
	kind = "🦢", -- A very good friend of mine loves swans
	ignored_file_types = { -- default is not to ignore
		-- uncomment to ignore in lua:
		-- lua = true
	},
}

function M:setup(params)
	for k, v in pairs(params or {}) do
		conf_defaults[k] = v
	end
end

function M:get(what)
	return conf_defaults[what]
end
return M
