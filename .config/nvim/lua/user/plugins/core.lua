return {
  {
    "goolord/alpha-nvim",
    opts = function(_, opts)
      opts.section.header.val = {
        "owo",
      }
      return opts
    end,
  },
  -- I don't need the debugger enabled all times, sorry
  { "mfussenegger/nvim-dap", enabled = false },
  -- Makes the seperators suitable since they were unanimously large on my installed set of Fira Code Nerd Fonts
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    opts = {
      icons = { group = vim.g.icons_enabled and "" or "+", separator = ">" },
      disable = { filetypes = { "TelescopePrompt" } },
    },
    config = require "plugins.configs.which-key",
  },
}
