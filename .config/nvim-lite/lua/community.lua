---@type LazySpec

return {
	{ "AstroNvim/astrocommunity" },
	{ import = "astrocommunity.pack.yaml" },
	{ import = "astrocommunity.colorscheme.tokyonight-nvim" },
	{ import = "astrocommunity.pack.tailwindcss" },
	{ import = "astrocommunity.pack.typescript" },
	{ import = "astrocommunity.pack.vue" },
	{ import = "astrocommunity.lsp.ts-error-translator-nvim" },
	{ import = "astrocommunity.code-runner.overseer-nvim" },
	{ import = "astrocommunity.project.nvim-spectre" },
	{ import = "astrocommunity.terminal-integration.flatten-nvim" },
	{ import = "astrocommunity.syntax.hlargs-nvim" },
	{ import = "astrocommunity.lsp.garbage-day-nvim" },
	{ import = "astrocommunity.lsp.lsp-signature-nvim" },
	{ import = "astrocommunity.color.nvim-highlight-colors" },
	{ import = "astrocommunity.color.twilight-nvim" },
	{ import = "astrocommunity.color.headlines-nvim" },
	{ import = "astrocommunity.diagnostics.lsp_lines-nvim" },
	{ import = "astrocommunity.fuzzy-finder.telescope-zoxide" },
	-- import/override with your plugins folder
	{ import = "plugins" },
}
