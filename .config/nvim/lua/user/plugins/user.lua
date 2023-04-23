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
      on_highlights = function(hl, c) end,
    },
  },
  { "AstroNvim/astrotheme" },
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
      multi_line = true,
      is_enabled = false,
      highlight = "Type",
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
