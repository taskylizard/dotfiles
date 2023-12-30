local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.g.astronvim_first_install = true -- lets AstroNvim know that this is an initial installation
  -- stylua: ignore
  vim.fn.system({ "git", "clone", "--filter=blob:none", "https://github.com/folke/lazy.nvim.git", "--branch=stable", lazypath })
end
vim.opt.rtp:prepend(vim.env.LAZY or lazypath)

require("lazy").setup {
  spec = {
    -- TODO: change `branch="v4"` to `version="^4"` on release
    { "AstroNvim/AstroNvim", branch = "v4", import = "astronvim.plugins" },
    -- AstroCommunity: import any community modules here
    -- TODO: Remove branch v4 on release
    { "AstroNvim/astrocommunity", branch = "v4" },
    { import = "astrocommunity.pack.lua" },
    { import = "astrocommunity.colorscheme.tokyonight-nvim" },
    { import = "astrocommunity.color.ccc-nvim" },
    { import = "astrocommunity.editing-support.todo-comments-nvim" },
    { import = "astrocommunity.editing-support.rainbow-delimiters-nvim" },
    -- { import = "astrocommunity.editing-support.refactoring-nvim" },
    { import = "astrocommunity.editing-support.nvim-regexplainer" },
    { import = "astrocommunity.pack.toml" },
    { import = "astrocommunity.pack.json" },
    { import = "astrocommunity.pack.rust" },
    { import = "astrocommunity.pack.go" },
    { import = "astrocommunity.pack.python-ruff" },
    { import = "astrocommunity.pack.prisma" },
    { import = "astrocommunity.pack.tailwindcss" },
    { import = "astrocommunity.pack.gleam" },
    { import = "astrocommunity.pack.crystal" },
    { import = "astrocommunity.pack.typescript" },
    { import = "astrocommunity.code-runner.overseer-nvim" },
    { import = "astrocommunity.project.nvim-spectre" },
    { import = "astrocommunity.terminal-integration.flatten-nvim" },
    { import = "astrocommunity.syntax.hlargs-nvim" },
    { import = "astrocommunity.lsp.garbage-day-nvim" },
    { import = "astrocommunity.lsp.lsp-signature-nvim" },

    -- import/override with your plugins
    { import = "plugins" },
  },
  install = { colorscheme = { "astrodark", "habamax" } },
  performance = {
    rtp = {
      -- disable some rtp plugins, add more to your liking
      disabled_plugins = {
        "gzip",
        "netrwPlugin",
        "tarPlugin",
        "tohtml",
        "zipPlugin",
      },
    },
  },
}
