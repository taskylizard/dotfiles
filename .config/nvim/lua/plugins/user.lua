---@type LazySpec
return {
	{ "vim-crystal/vim-crystal", ft = { "crystal" } },
	{ "https://github.com/gleam-lang/gleam.vim", ft = { "gleam" } },
	{
		"nacro90/numb.nvim",
		event = "BufRead",
		opts = {
			show_numbers = true,
			show_cursorline = true,
		},
	},
	{
		"ray-x/lsp_signature.nvim",
		event = "BufRead",
		config = function()
			require("lsp_signature").setup()
		end,
	},
	{
		"goolord/alpha-nvim",
		opts = function(_, opts)
			-- customize the dashboard header
			opts.section.header.val = {
				"                                                     ",
				"                   -++++++++=         =======-       ",
				"                   *#*******#-       -*******:       ",
				"                  =#**********-      +******=        ",
				"                 :#************-    -*******:        ",
				"                 +#**##*********:   *******=         ",
				"                -#**#**+*********: =#******:         ",
				"                ***#*+++=+*****+*+:******#+--        ",
				"               +#*#*+++*::*+++++++*########+         ",
				"              :#*#*++++=  =*+*****######%#-          ",
				"              *#**+++**++**#*****#######%-           ",
				"             =###*###########****######%*            ",
				"            :##########***####**#%######-            ",
				"            +#################**#######*             ",
				"           -#########**+=-:::**#######%+             ",
				"           ######***-        -#%%%%%%%#--            ",
				"          -+========          +*******=:::           ",
				"                                                     ",
			}
			return opts
		end,
	},
	{
		"L3MON4D3/LuaSnip",
		config = function(plugin, opts)
			require("astronvim.plugins.configs.luasnip")(plugin, opts) -- include the default astronvim config that calls the setup call
			-- add more custom luasnip configuration such as filetype extend or custom snippets
			local luasnip = require("luasnip")
			luasnip.filetype_extend("javascript", { "javascriptreact" })
		end,
	},
	{
		"windwp/nvim-autopairs",
		config = function(plugin, opts)
			require("astronvim.plugins.configs.nvim-autopairs")(plugin, opts) -- include the default astronvim config that calls the setup call
			-- add more custom autopairs configuration such as custom rules
			local npairs = require("nvim-autopairs")
			local Rule = require("nvim-autopairs.rule")
			local cond = require("nvim-autopairs.conds")
			npairs.add_rules(
				{
					Rule("$", "$", { "tex", "latex" })
						-- don't add a pair if the next character is %
						:with_pair(cond.not_after_regex("%%"))
						-- don't add a pair if  the previous character is xxx
						:with_pair(
							cond.not_before_regex("xxx", 3)
						)
						-- don't move right when repeat character
						:with_move(cond.none())
						-- don't delete if the next character is xx
						:with_del(cond.not_after_regex("xx"))
						-- disable adding a newline when you press <cr>
						:with_cr(cond.none()),
				},
				-- disable for .vim files, but it work for another filetypes
				Rule("a", "a", "-vim")
			)
		end,
	},
	{
		"folke/noice.nvim",
		event = "VeryLazy",
		dependencies = {
			"MunifTanjim/nui.nvim",
			"nvim-treesitter/nvim-treesitter",
		},
		opts = function(_, opts)
			return require("astrocore").extend_tbl(opts, require("plugins.configs.noice"))
		end,
		init = function()
			vim.g.lsp_handlers_enabled = false
		end,
	},
	{
		"overseer.nvim",
		cmd = {
			"OverseerOpen",
			"OverseerClose",
			"OverseerToggle",
			"OverseerSaveBundle",
			"OverseerLoadBundle",
			"OverseerDeleteBundle",
			"OverseerRunCmd",
			"OverseerRun",
			"OverseerInfo",
			"OverseerBuild",
			"OverseerQuickAction",
			"OverseerTaskAction ",
			"OverseerClearCache",
		},
		dependencies = {
			{ "AstroNvim/astroui", opts = { icons = { Overseer = "" } } },
			{
				"AstroNvim/astrocore",
				opts = function(_, opts)
					local maps = opts.mappings
					local prefix = "<leader>T"
					maps.n[prefix] = { desc = require("astroui").get_icon("Overseer", 1, true) .. "Overseer" }

					maps.n[prefix .. "t"] = { "<Cmd>OverseerToggle<CR>", desc = "Toggle" }
					maps.n[prefix .. "c"] = { "<Cmd>OverseerRunCmd<CR>", desc = "Run Command" }
					maps.n[prefix .. "r"] = { "<Cmd>OverseerRun<CR>", desc = "Run Task" }
					maps.n[prefix .. "q"] = { "<Cmd>OverseerQuickAction<CR>", desc = "Quick Action" }
					maps.n[prefix .. "a"] = { "<Cmd>OverseerTaskAction<CR>", desc = "Task Action" }
					maps.n[prefix .. "i"] = { "<Cmd>OverseerInfo<CR>", desc = "Info" }
				end,
			},
		},
		opts = {
			-- Template modules to load
			templates = { "builtin" },
			task_list = {
				bindings = {
					["{"] = "DecreaseWidth",
					["}"] = "IncreaseWidth",
					["["] = "PrevTask",
					["]"] = "NextTask",
				},
			},
		},
	},
}
