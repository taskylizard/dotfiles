---@type LazySpec
return {
  { "vim-crystal/vim-crystal", ft = { "crystal" } },
  { "https://github.com/gleam-lang/gleam.vim", ft = { "gleam" } },
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
    config = function() require("lsp_signature").setup() end,
  },

  -- customize alpha options
  {
    "goolord/alpha-nvim",
    opts = function(_, opts)
      -- customize the dashboard header
      opts.section.header.val = {
        "                                                     ",
        "                   -++++++++=         =======-       ",
        "                   *#*******#-       -*******:       ",
        "                  =#**********-      +******=        ",
        "                 :#************-    -*******:        ",
        "                 +#**##*********:   *******=         ",
        "                -#**#**+*********: =#******:         ",
        "                ***#*+++=+*****+*+:******#+--        ",
        "               +#*#*+++*::*+++++++*########+         ",
        "              :#*#*++++=  =*+*****######%#-          ",
        "              *#**+++**++**#*****#######%-           ",
        "             =###*###########****######%*            ",
        "            :##########***####**#%######-            ",
        "            +#################**#######*             ",
        "           -#########**+=-:::**#######%+             ",
        "           ######***-        -#%%%%%%%#--            ",
        "          -+========          +*******=:::           ",
        "                                                     ",
      }
      return opts
    end,
  },

  -- You can disable default plugins as follows:
  { "max397574/better-escape.nvim", enabled = false },

  -- You can also easily customize additional setup of plugins that is outside of the plugin's setup call
  {
    "L3MON4D3/LuaSnip",
    config = function(plugin, opts)
      require "astronvim.plugins.configs.luasnip"(plugin, opts) -- include the default astronvim config that calls the setup call
      -- add more custom luasnip configuration such as filetype extend or custom snippets
      local luasnip = require "luasnip"
      luasnip.filetype_extend("javascript", { "javascriptreact" })
    end,
  },

  {
    "windwp/nvim-autopairs",
    config = function(plugin, opts)
      require "astronvim.plugins.configs.nvim-autopairs"(plugin, opts) -- include the default astronvim config that calls the setup call
      -- add more custom autopairs configuration such as custom rules
      local npairs = require "nvim-autopairs"
      local Rule = require "nvim-autopairs.rule"
      local cond = require "nvim-autopairs.conds"
      npairs.add_rules(
        {
          Rule("$", "$", { "tex", "latex" })
            -- don't add a pair if the next character is %
            :with_pair(cond.not_after_regex "%%")
            -- don't add a pair if  the previous character is xxx
            :with_pair(
              cond.not_before_regex("xxx", 3)
            )
            -- don't move right when repeat character
            :with_move(cond.none())
            -- don't delete if the next character is xx
            :with_del(cond.not_after_regex "xx")
            -- disable adding a newline when you press <cr>
            :with_cr(cond.none()),
        },
        -- disable for .vim files, but it work for another filetypes
        Rule("a", "a", "-vim")
      )
    end,
  },
  {
    "overseer.nvim",
    opts = {
      -- Template modules to load
      templates = { "builtin" },
      task_list = {
        bindings = {
          ["{"] = "DecreaseWidth",
          ["}"] = "IncreaseWidth",
          ["["] = "PrevTask",
          ["]"] = "NextTask",
        },
      },
    },
    keys = {
      { "<leader>to", desc = "Task Runner", mode = { "n" } },
      { "<leader>toR", "<cmd>OverseerRunCmd<cr>", desc = "Run Command" },
      { "<leader>toa", "<cmd>OverseerTaskAction<cr>", desc = "Task Action" },
      { "<leader>tob", "<cmd>OverseerBuild<cr>", desc = "Build" },
      { "<leader>toc", "<cmd>OverseerClose<cr>", desc = "Close" },
      { "<leader>tod", "<cmd>OverseerDeleteBundle<cr>", desc = "Delete Bundle" },
      { "<leader>tol", "<cmd>OverseerLoadBundle<cr>", desc = "Load Bundle" },
      { "<leader>too", "<cmd>OverseerOpen<cr>", desc = "Open" },
      { "<leader>toq", "<cmd>OverseerQuickAction<cr>", desc = "Quick Action" },
      { "<leader>tor", "<cmd>OverseerRun<cr>", desc = "Run" },
      { "<leader>tos", "<cmd>OverseerSaveBundle<cr>", desc = "Save Bundle" },
      { "<leader>tot", "<cmd>OverseerToggle<cr>", desc = "Toggle" },
    },
  },
}
