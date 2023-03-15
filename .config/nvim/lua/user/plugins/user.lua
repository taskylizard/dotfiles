return {
  { "p00f/nvim-ts-rainbow", event = "VeryLazy" },
  {
    "vuki656/package-info.nvim",
    requires = "MunifTanjim/nui.nvim",
    config = true,
    event = "BufRead package.json",
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
  -- { import = opts = { ensure_installed = {"prettierd"} }"astrocommunity.pack.typescript", opts = { ensure_installed = {"prettierd"} }},
  -- { "pack.typescript", opts = { ensure_installed = {"prettierd"} } },
  { "mfussenegger/nvim-dap", enabled = false },
  {
    "folke/tokyonight.nvim",
    opts = {
      sidebars = { "qf", "vista_kind", "terminal", "packer" },
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
  { "andweeb/presence.nvim", event = "VeryLazy", opts = { client_id = "1009122352916857003" } },
  { "folke/todo-comments.nvim", event = "BufRead" },
  { "ray-x/lsp_signature.nvim", event = "BufRead" },
  { "nathom/easy-replace.nvim" },
  { "kvrohit/substrata.nvim" },
  -- {
  --   "lvauthrin/chatgpt.nvim",
  --   lazy = false,
  --   config = function(_, _)
  --     require("chatgpt").setup({ api_key = os.getenv("OPENAI_API_KEY") })
  --   end,
  -- },
}
