return {
  { "p00f/nvim-ts-rainbow", event = "VeryLazy" },
  {
    "vuki656/package-info.nvim",
    dependencies = "MunifTanjim/nui.nvim",
    opts = { package_manager = "pnpm" },
    event = "BufRead package.json",
    config = function(_, opts)
      local h = require "package-info"
      h.setup(opts)
      -- Show dependency versions
      vim.keymap.set(
        { "n" },
        "<LEADER>ns",
        h.show,
        { silent = true, noremap = true, desc = "Show dependency versions" }
      )

      -- Hide dependency versions
      vim.keymap.set(
        { "n" },
        "<LEADER>nc",
        h.hide,
        { silent = true, noremap = true, desc = "Hide dependency versions" }
      )

      -- Toggle dependency versions
      vim.keymap.set(
        { "n" },
        "<LEADER>nt",
        h.toggle,
        { silent = true, noremap = true, desc = "Toggle dependency versions" }
      )

      -- Update dependency on the line
      vim.keymap.set(
        { "n" },
        "<LEADER>nu",
        h.update,
        { silent = true, noremap = true, desc = "Update dependency on the line" }
      )

      -- Delete dependency on the line
      vim.keymap.set(
        { "n" },
        "<LEADER>nd",
        h.delete,
        { silent = true, noremap = true, desc = "Delete dependency on the line" }
      )

      -- Install a new dependency
      vim.keymap.set(
        { "n" },
        "<LEADER>ni",
        h.install,
        { silent = true, noremap = true, desc = "Install a new dependency" }
      )

      -- Install a different dependency version
      vim.keymap.set(
        { "n" },
        "<LEADER>np",
        h.change_version,
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
  { "andweeb/presence.nvim", event = "VeryLazy" },
  { "folke/todo-comments.nvim", event = "BufRead" },
  { "ray-x/lsp_signature.nvim", event = "BufRead" },
  { "nathom/easy-replace.nvim" },
  { "kvrohit/substrata.nvim" },
  {
    "marilari88/twoslash-queries.nvim",
    event = "BufReadPre",
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
  {
    "ggandor/flit.nvim",
    keys = function()
      ---@type LazyKeys[]
      local ret = {}
      for _, key in ipairs { "f", "F", "t", "T" } do
        ret[#ret + 1] = { key, mode = { "n", "x", "o" }, desc = key }
      end
      return ret
    end,
    opts = { labeled_modes = "nx" },
    dependencies = {
      "ggandor/leap.nvim",
      keys = {
        { "s", mode = { "n", "x", "o" }, desc = "Leap forward to" },
        { "S", mode = { "n", "x", "o" }, desc = "Leap backward to" },
        { "gs", mode = { "n", "x", "o" }, desc = "Leap from windows" },
      },
      config = function(_, opts)
        local leap = require "leap"
        for k, v in pairs(opts) do
          leap.opts[k] = v
        end
        leap.add_default_mappings(true)
      end,
    },
  },
}
