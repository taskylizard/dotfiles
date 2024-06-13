-- This will run last in the setup process and is a good place to configure
-- things like custom filetypes. This just pure lua so anything that doesn't
-- fit in the normal config locations above can go here

local c = require("tokyonight.colors").setup() -- pass in any of the config options as explained above

-- Markdown notes highlights
vim.api.nvim_create_autocmd({ "BufReadPost", "InsertLeave" }, {
	desc = "Highlight markdown notes.",
	group = vim.api.nvim_create_augroup("markdown_notes_hl", { clear = true }),
	callback = function()
		if vim.bo.filetype == "markdown" then
			vim.defer_fn(function()
				-- TASK:
				vim.cmd(":silent! highlight clear MarkdownTask")
				vim.cmd(":highlight MarkdownTask guifg=" .. c.teal)
				vim.cmd(":syntax match MarkdownTask /\\c\\w*Task[^:]*:/")

				-- ACTION:
				vim.cmd(":silent! highlight clear MarkdownAction")
				vim.cmd(":highlight MarkdownAction guifg=" .. c.teal)
				vim.cmd(":syntax match MarkdownAction /\\c\\w*Action[^:]*:/")

				-- TODO:
				vim.cmd(":silent! highlight clear MarkdownTodo")
				vim.cmd(":highlight MarkdownTodo guifg=" .. c.yellow)
				vim.cmd(":syntax match MarkdownTodo /\\c\\w*Todo[^:]*:/")

				-- BUG:
				vim.cmd(":silent! highlight clear MarkdownBug")
				vim.cmd(":highlight MarkdownBug guifg=" .. c.yellow)
				vim.cmd(":syntax match MarkdownBug /\\c\\w*Bug[^:]*:/")

				-- FOCUS:
				vim.cmd(":silent! highlight clear MarkdownFocus")
				vim.cmd(":highlight MarkdownFocus guifg=" .. c.yellow)
				vim.cmd(":syntax match MarkdownFocus /\\c\\w*Focus[^:]*:/")

				-- NOTE:
				vim.cmd(":silent! highlight clear MarkdownNote")
				vim.cmd(":highlight MarkdownNote guifg=" .. c.red)
				vim.cmd(":syntax match MarkdownNote /\\c\\w*Note[^:]*:/")

				-- SEE:
				vim.cmd(":silent! highlight clear MarkdownSee")
				vim.cmd(":highlight MarkdownSee guifg=" .. c.blue)
				vim.cmd(":syntax match MarkdownSee /\\c\\w*See[^:]*:/")

				-- CHECK:
				vim.cmd(":silent! highlight clear MarkdownCheck")
				vim.cmd(":highlight MarkdownCheck guifg=" .. c.green)
				vim.cmd(":syntax match MarkdownCheck /\\c\\w*Check[^:]*:/")

				-- URL:
				vim.cmd(":silent! highlight clear MarkdownURL")
				vim.cmd(":highlight MarkdownURL guifg=" .. c.purple)
				vim.cmd(":syntax match MarkdownURL /\\c\\w*url[^:]*:/")

				-- EXAMPLE:
				vim.cmd(":silent! highlight clear MarkdownExample")
				vim.cmd(":highlight MarkdownExample guifg=" .. c.magenta)
				vim.cmd(":syntax match MarkdownExample /\\c\\w*Example[^:]*:/")
			end, 100)
		end
	end,
})

-- Create parent directories when saving a file.
vim.api.nvim_create_autocmd("BufWritePre", {
	desc = "Automatically create parent directories if they don't exist when saving a file",
	callback = function(args)
		local buf_is_valid_and_listed = vim.api.nvim_buf_is_valid(args.buf) and vim.bo[args.buf].buflisted

		if buf_is_valid_and_listed then
			vim.fn.mkdir(vim.fn.fnamemodify(vim.loop.fs_realpath(args.match) or args.match, ":p:h"), "p")
		end
	end,
})

vim.api.nvim_create_autocmd("FileType", {
	desc = "Enable wrap and spell for text like documents",
	pattern = { "gitcommit", "markdown", "text", "plaintext" },
	callback = function()
		vim.opt_local.wrap = true
		vim.opt_local.spell = true
	end,
})
