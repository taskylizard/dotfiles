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
  { "mfussenegger/nvim-dap", enabled = false },
  {
    "folke/tokyonight.nvim",
    opts = {
      sidebars = { "qf", "vista_kind", "terminal" },
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
  {
    "marilari88/twoslash-queries.nvim",
    event = "BufRead",
    ft = { "typescript", "typescriptreact" },
    opts = { mult_line = true },
  },
  {
    "lvauthrin/chatgpt.nvim",
    cmd = { "ChatGPT" },
    opts = { api_key = os.getenv "OPENAI_API_KEY" },
  },
  { "folke/drop.nvim", event = "BufRead" },
}
