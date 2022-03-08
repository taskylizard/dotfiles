local gps = require("nvim-gps")
gps.setup({
	icons = {
		["class-name"] = '🪑',      -- Classes and class-like objects
		["function-name"] = ' ',   -- Functions
		["method-name"] = ' ',     -- Methods (functions inside class-like objects)
		["container-name"] = '🏛️ ',  -- Containers (example: lua tables)
		["tag-name"] = '炙'         -- Tags (example: html tags)
	},
	languages = {},
	separator = ' > ',
  depth = 0,
  depth_limit_indicator = 'ok',
})
-- Statusline
require("lualine").setup({
	sections = {
			lualine_c = {
				{ gps.get_location, cond = gps.is_available },
        {'coc#status()'}
    },
	}
})
