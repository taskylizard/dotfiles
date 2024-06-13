return {
	-- Disable lsp related notificaitons
	lsp = {
		-- Override markdown rendering so that **cmp** and other plugins use **Treesitter**
		override = {
			["vim.lsp.util.convert_input_to_markdown_lines"] = true,
			["vim.lsp.util.stylize_markdown"] = true,
			["cmp.entry.get_documentation"] = true,
		},
		progress = { enabled = false },
		hover = { enabled = false },
		signature = { enabled = false },
	},
	presets = {
		bottom_search = false, -- use a classic bottom cmdline for search
		command_palette = false, -- position the cmdline and popupmenu together
		long_message_to_split = true, -- long messages will be sent to a split
		inc_rename = false, -- enables an input dialog for inc-rename.nvim
		lsp_doc_border = false, -- add a border to hover docs and signature help
	},
	routes = {
		-- Disable "written" notification
		{
			filter = { event = "msg_show", kind = "", find = "written" },
			opts = { skip = true },
		},
		-- Disable paste/undo notification
		{
			filter = { event = "msg_show", find = "^%d+ more lines" },
			opts = { skip = true },
		},
		-- Disable delete/undo notification
		{
			filter = { event = "msg_show", find = "^%d+ fewer lines" },
			opts = { skip = true },
		},
		-- Disable yank notification
		{
			filter = { event = "msg_show", find = "^%d+ lines yanked$" },
			opts = { skip = true },
		},
		-- Disable move notification
		{
			filter = { event = "msg_show", find = "^%d+ lines moved$" },
		},
	},
	-- Display cmdline and popupmenu together
	views = {
		cmdline_popup = {
			position = {
				row = 5,
				col = "50%",
			},
			size = {
				width = 60,
				height = "auto",
			},
		},
		popupmenu = {
			relative = "editor",
			position = {
				row = 8,
				col = "50%",
			},
			size = {
				width = 60,
				height = 10,
			},
			border = {
				style = "rounded",
				padding = { 0, 1 },
			},
			win_options = {
				winhighlight = { Normal = "Normal", FloatBorder = "DiagnosticInfo" },
			},
		},
	},
}
