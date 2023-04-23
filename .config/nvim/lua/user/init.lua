return {
  updater = {
    remote = "origin",
    channel = "stable",
    version = "latest",
    branch = "nightly",
    commit = nil,
    pin_plugins = nil,
    skip_prompts = false,
    show_changelog = true,
    auto_quit = false,
    remotes = {},
  },

  colorscheme = "tokyonight-night",

  diagnostics = {
    virtual_text = true,
    underline = true,
  },

  lsp = {
    formatting = {
      async = true,
      format_on_save = {
        enabled = true,
        allow_filetypes = {},
        ignore_filetypes = {},
      },
      disabled = {},
      timeout_ms = 1000,
    },
    servers = {
      "unocss",
    },

    config = {},
  },

  lazy = {
    defaults = { lazy = true },
    performance = {
      rtp = {
        disabled_plugins = {
          "tohtml",
          "gzip",
          "matchit",
          "zipPlugin",
          "netrwPlugin",
          "tarPlugin",
        },
      },
    },
  },

  polish = function()
    local function alpha_on_bye(cmd)
      local bufs = vim.fn.getbufinfo { buflisted = true }
      vim.cmd(cmd)
      if require("astronvim.utils").is_available "alpha-nvim" and not bufs[2] then require("alpha").start(true) end
    end
    vim.keymap.del("n", "<leader>c")
    if require("astronvim.utils").is_available "bufdelete.nvim" then
      vim.keymap.set("n", "<leader>c", function() alpha_on_bye "Bdelete!" end, { desc = "Close buffer" })
    else
      vim.keymap.set("n", "<leader>c", function() alpha_on_bye "bdelete!" end, { desc = "Close buffer" })
    end
    vim.filetype.add {
      extension = {
        astro = "astro",
      },
    }
    vim.api.nvim_create_autocmd("FileType", {
      pattern = "typescript",
      callback = function() vim.opt.matchpairs:append "<:>" end,
    })
  end,
}
