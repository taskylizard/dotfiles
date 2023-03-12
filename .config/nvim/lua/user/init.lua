return {
  -- Configure AstroNvim updates
  updater = {
    remote = "origin", -- remote to use
    channel = "stable", -- "stable" or "nightly"
    version = "latest", -- "latest", tag name, or regex search like "v1.*" to only do updates before v2 (STABLE ONLY)
    branch = "nightly", -- branch name (NIGHTLY ONLY)
    commit = nil, -- commit hash (NIGHTLY ONLY)
    pin_plugins = nil, -- nil, true, false (nil will pin plugins on stable only)
    skip_prompts = false, -- skip prompts about breaking changes
    show_changelog = true, -- show the changelog after performing an update
    auto_quit = false, -- automatically quit the current session after a successful update
    remotes = { -- easily add new remotes to track
      --   ["remote_name"] = "https://remote_url.come/repo.git", -- full remote url
      --   ["remote2"] = "github_user/repo", -- GitHub user/repo shortcut,
      --   ["remote3"] = "github_user", -- GitHub user assume AstroNvim fork
    },
  },

  -- Set colorscheme to use
  colorscheme = "tokyonight-night",

  -- Diagnostics configuration (for vim.diagnostics.config({...})) when diagnostics are on
  diagnostics = {
    virtual_text = true,
    underline = true,
  },

  lsp = {
    -- customize lsp formatting options
    formatting = {
      async = true,
      -- control auto formatting on save
      format_on_save = {
        enabled = true, -- enable or disable format on save globally
        allow_filetypes = { -- enable format on save for specified filetypes only
          -- "go",
        },
        ignore_filetypes = { -- disable format on save for specified filetypes
          -- "python",
        },
      },
      disabled = { -- disable formatting capabilities for the listed language servers
        -- "sumneko_lua",
      },
      timeout_ms = 1000, -- default format timeout
      -- filter = function(client) -- fully override the default formatting function
      --   return true
      -- end
    },
    -- enable servers that you already have installed without mason
    servers = {
      "unocss",
      -- "pyright"
    },

    config = {
      ["unocss"] = {
        filetypes = {
          "astro",
          "html",
          "typescriptreact",
        },
        on_new_config = function(new_config) end,
        root_dir = function(fname)
          return require("lspconfig.util").root_pattern("unocss.config.js", "unocss.config.ts")(fname)
        end,
      },
      tsserver = {
        settings = {
          typescript = {
            importModuleSpecifier = "non-relative",
          },
        },
      },
      tailwindcss = {
        settings = {
          rootdir = {
            "tailwind.config.cjs",
          },
        },
      },
    },
  },

  -- Configure require("lazy").setup() options
  lazy = {
    defaults = { lazy = true },
    performance = {
      rtp = {
        -- customize default disabled vim plugins
        disabled_plugins = {
          "tohtml",
          "gzip",
          "matchit",
          "zipPlugin",
          "netrwPlugin",
          "tarPlugin",
          "matchparen",
        },
      },
    },
  },

  -- This function is run last and is a good place to configuring
  -- augroups/autocommands and custom filetypes also this just pure lua so
  -- anything that doesn't fit in the normal config locations above can go here
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
  end,
}
