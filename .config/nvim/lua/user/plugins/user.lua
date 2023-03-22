return {
  { "p00f/nvim-ts-rainbow", event = "VeryLazy" },
  {
    "vuki656/package-info.nvim",
    dependencies = "MunifTanjim/nui.nvim",
    opts = { package_manager = "pnpm" },
    event = "BufRead package.json",
    config = function(_, opts)
      local package = require "package-info"
      package.setup(opts)
      -- Show dependency versions
      vim.keymap.set(
        { "n" },
        "<LEADER>ns",
        package.show,
        { silent = true, noremap = true, desc = "Show dependency versions" }
      )

      -- Hide dependency versions
      vim.keymap.set(
        { "n" },
        "<LEADER>nc",
        package.hide,
        { silent = true, noremap = true, desc = "Hide dependency versions" }
      )

      -- Toggle dependency versions
      vim.keymap.set(
        { "n" },
        "<LEADER>nt",
        package.toggle,
        { silent = true, noremap = true, desc = "Toggle dependency versions" }
      )

      -- Update dependency on the line
      vim.keymap.set(
        { "n" },
        "<LEADER>nu",
        package.update,
        { silent = true, noremap = true, desc = "Update dependency on the line" }
      )

      -- Delete dependency on the line
      vim.keymap.set(
        { "n" },
        "<LEADER>nd",
        package.delete,
        { silent = true, noremap = true, desc = "Delete dependency on the line" }
      )

      -- Install a new dependency
      vim.keymap.set(
        { "n" },
        "<LEADER>ni",
        package.install,
        { silent = true, noremap = true, desc = "Install a new dependency" }
      )

      -- Install a different dependency version
      vim.keymap.set(
        { "n" },
        "<LEADER>np",
        package.change_version,
        { silent = true, noremap = true, desc = "Install a different dependency version" }
      )
    end,
  },
  {
    "jose-elias-alvarez/typescript.nvim",
    init = function() return { "tsserver" } end,
    ft = {
      "typescript",
      "typescriptreact",
      "javascript",
      "javascriptreact",
      "astro",
    },
    opts = function() return { server = require("astronvim.utils.lsp").config "tsserver" } end,
  },
  {
    "folke/tokyonight.nvim",
    opts = {
      sidebars = { "qf", "vista_kind", "terminal", "neotree" },
    },
  },
  {
    "nacro90/numb.nvim",
    event = "BufRead",
    opts = {
      show_numbers = true, -- Enable 'number' for the window while peeking
      show_cursorline = true, -- Enable 'cursorline' for the window while peeking
    },
  },
  { "npxbr/glow.nvim", ft = { "markdown" } },
  { "ObserverOfTime/nvimcord", event = "VeryLazy", opts = {
    autostart = true,
  } },
  { "folke/todo-comments.nvim", event = "BufRead" },
  { "ray-x/lsp_signature.nvim", event = "BufRead" },
  { "nathom/easy-replace.nvim" },
  { "kvrohit/substrata.nvim" },
  {
    "marilari88/twoslash-queries.nvim",
    opts = {
      multi_line = true, -- to print types in multi line mode
      is_enabled = false, -- to keep disabled at startup and enable it on request with the EnableTwoslashQueries
      highlight = "Type", -- to set up a highlight group for the virtual text
    },
    keys = {
      { "<C-k>", "<cmd>InspectTwoslashQueries<CR>", desc = "InspectTwoslashQueries" },
    },
    ft = { "typescript", "typescriptreact" },
  },
  {
    "lvauthrin/chatgpt.nvim",
    cmd = { "ChatGPT" },
    opts = { api_key = os.getenv "OPENAI_API_KEY" },
  },
  { "folke/drop.nvim", event = "VeryLazy" },
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      { "roobert/tailwindcss-colorizer-cmp.nvim", config = true },
    },
    opts = function(_, opts)
      local format_kinds = opts.formatting.format
      opts.formatting.format = function(entry, item)
        format_kinds(entry, item)
        return require("tailwindcss-colorizer-cmp").formatter(entry, item)
      end
    end,
  },
}
