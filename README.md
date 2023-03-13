# cmp-dictionary-nanny
This is a nvim-cmp plugin that can help complete words and view translated documents

https://user-images.githubusercontent.com/57088952/224658367-892d8267-fec2-49c7-be1e-f996a85ba3db.mp4

## Install
`packer.nvim`
```lua
use {
    "denstiny/cmp-dictionary-nanny",
    config = function ()
      require("cmp-dictionary-nanny.config").setup({opt})
    end
    run = "./install.sh"
}
```
`lazy.nvim`
```lua
{
  "denstiny/cmp-dictionary-nanny",
  build = "./install.sh",
  event = { "InsertEnter" },
}
```
## Default configuration
```lua
local conf_defaults = {
	max_num_results = 20,
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
```
## Senior players
you can custom database(default chinese database)
### database requirements
| key | describe |
| :-: | :-:      |
| word | completion of the words |
| definition | The word meaning |
| translation | word translation |
| frq | Contemporary corpus word frequency |
| bnc | Word processing |
| phonetic | phonetic symbol |
