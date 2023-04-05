return {
  { "p00f/nvim-ts-rainbow", event = "VeryLazy" },
  { "folke/drop.nvim", event = "VeryLazy" },
  { "npxbr/glow.nvim", ft = { "markdown" } },
  { "andweeb/presence.nvim", event = "VeryLazy" },
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
  {
    "ray-x/lsp_signature.nvim",
    event = "BufRead",
    opts = {
      bind = true,
      handler_opts = {
        border = "rounded",
      },
    },
  },
  { "nathom/easy-replace.nvim" },
  { "kvrohit/substrata.nvim" },
  { "Selmer443/poimandres.nvim", event = "VeryLazy" },
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
}
