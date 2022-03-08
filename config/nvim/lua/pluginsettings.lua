-- --------------------------------------------------------------------------- -
--                                                                             -
--                                                      :::      ::::::::      -
--   pluginsettings.lua                               :+:      :+:    :+:      -
--                                                  +:+ +:+         +:+        -
--   By: taskylizard                              +#+  +:+       +#+           -
--                                              +#+#+#+#+#+   +#+              -
--   Created: 2021/12/13 12:04:19 by taskylizard     #+#    #+#                -
--   Updated: 2021/12/13 12:11:05 by taskylizard    ###   ########.fr          -
--                                                                             -
-- --------------------------------------------------------------------------- -

local gitsigns = require('gitsigns')
local gps = require("nvim-gps")
local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }
local cmd = vim.cmd
vim.notify = require("notify")
vim.g.nvim_tree_respect_buf_cwd = 1
local autosave = require("autosave")


-- Sane setup stuff
--
-- Telescope
require('telescope').load_extension('coc')
require'telescope'.load_extension('project')
require("telescope").load_extension('packer')
require('neoscroll').setup()
require'spaceless'.setup()

require('nvim_comment').setup()
require'colorizer'.setup()
require('nvim-autopairs').setup()
require('lualine').setup()

cmd [[highlight IndentBlanklineIndent1 guifg=#E06C75 gui=nocombine]]
cmd [[highlight IndentBlanklineIndent2 guifg=#E5C07B gui=nocombine]]
cmd [[highlight IndentBlanklineIndent3 guifg=#98C379 gui=nocombine]]
cmd [[highlight IndentBlanklineIndent4 guifg=#56B6C2 gui=nocombine]]
cmd [[highlight IndentBlanklineIndent5 guifg=#61AFEF gui=nocombine]]
cmd [[highlight IndentBlanklineIndent6 guifg=#C678DD gui=nocombine]]

require("indent_blankline").setup {
    space_char_blankline = " ",
    char_highlight_list = {
        "IndentBlanklineIndent1",
        "IndentBlanklineIndent2",
        "IndentBlanklineIndent3",
        "IndentBlanklineIndent4",
        "IndentBlanklineIndent5",
        "IndentBlanklineIndent6",
    },
}

-- INFO: Start configuring
--
-- for gitsigns
gitsigns.setup{
  signs = {
    add = {text = '┃' },
    change = {text = '┃' },
    delete = {linehl = 'NormalNC'},
    topdelete = {linehl = 'NormalNC'},
    preview_config = {border = 'rounded',},
    current_line_blame_formatter_opts = {relative_time = true},
    current_line_blame_opts = {delay = 200},
    count_chars = {'₁', '₂', '₃', '₄', '₅', '₆', '₇', '₈', '₉', ['+']='₊'},
    _refresh_staged_on_update = false,
    word_diff = true,
  }
}

require('specs').setup{
    show_jumps  = true,
    min_jump = 15,
    popup = {
        delay_ms = 4, -- delay before popup displays
        inc_ms = 20, -- time increments used for fade/resize effects
        blend = 4, -- starting blend, between 0-100 (fully transparent), see :h winblend
        width = 10,
        winhl = "PMenu",
        fader = require('specs').pulse_fader,
        resizer = require('specs').slide_resizer
    },
    ignore_filetypes = {},
    ignore_buftypes = {
        nofile = true,
    },
}


autosave.setup(
    {
        enabled = true,
        execution_message = "AutoSave: saved at " .. vim.fn.strftime("%H:%M:%S"),
        events = {"InsertLeave", "TextChanged"},
        conditions = {
            exists = true,
            filename_is_not = {},
            filetype_is_not = {},
            modifiable = true
        },
        write_all_buffers = false,
        on_off_commands = true,
        clean_command_line_interval = 0,
        debounce_delay = 135
    }
)

require("nvim-tree").setup({
  update_cwd = true,
  update_focused_file = {
    enable = true,
    update_cwd = true
  },
})

require("project_nvim").setup {manual_mode = true,show_hidden = true}

local cb = require'diffview.config'.diffview_callback
require'diffview'.setup {
  diff_binaries = false,    -- Show diffs for binaries
  enhanced_diff_hl = false, -- See ':h diffview-config-enhanced_diff_hl'
  use_icons = true,         -- Requires nvim-web-devicons
  icons = {                 -- Only applies when use_icons is true.
    folder_closed = "",
    folder_open = "",
  },
  signs = {
    fold_closed = "",
    fold_open = "",
  },
  file_panel = {
    position = "left",                  -- One of 'left', 'right', 'top', 'bottom'
    width = 35,                         -- Only applies when position is 'left' or 'right'
    height = 10,                        -- Only applies when position is 'top' or 'bottom'
    listing_style = "tree",             -- One of 'list' or 'tree'
    tree_options = {                    -- Only applies when listing_style is 'tree'
      flatten_dirs = true,              -- Flatten dirs that only contain one single dir
      folder_statuses = "only_folded",  -- One of 'never', 'only_folded' or 'always'.
    },
  },
  file_history_panel = {
    position = "bottom",
    width = 35,
    height = 16,
    log_options = {
      max_count = 256,      -- Limit the number of commits
      follow = false,       -- Follow renames (only for single file)
      all = false,          -- Include all refs under 'refs/' including HEAD
      merges = false,       -- List only merge commits
      no_merges = false,    -- List no merge commits
      reverse = false,      -- List commits in reverse order
    },
  },
  default_args = {    -- Default args prepended to the arg-list for the listed commands
    DiffviewOpen = {},
    DiffviewFileHistory = {},
  },
  hooks = {},         -- See ':h diffview-config-hooks'
  key_bindings = {
    disable_defaults = false,                   -- Disable the default key bindings
    -- The `view` bindings are active in the diff buffers, only when the current
    -- tabpage is a Diffview.
    view = {
      ["<tab>"]      = cb("select_next_entry"),  -- Open the diff for the next file
      ["<s-tab>"]    = cb("select_prev_entry"),  -- Open the diff for the previous file
      ["gf"]         = cb("goto_file"),          -- Open the file in a new split in previous tabpage
      ["<C-w><C-f>"] = cb("goto_file_split"),    -- Open the file in a new split
      ["<C-w>gf"]    = cb("goto_file_tab"),      -- Open the file in a new tabpage
      ["<leader>e"]  = cb("focus_files"),        -- Bring focus to the files panel
      ["<leader>b"]  = cb("toggle_files"),       -- Toggle the files panel.
    },
    file_panel = {
      ["j"]             = cb("next_entry"),           -- Bring the cursor to the next file entry
      ["<down>"]        = cb("next_entry"),
      ["k"]             = cb("prev_entry"),           -- Bring the cursor to the previous file entry.
      ["<up>"]          = cb("prev_entry"),
      ["<cr>"]          = cb("select_entry"),         -- Open the diff for the selected entry.
      ["o"]             = cb("select_entry"),
      ["<2-LeftMouse>"] = cb("select_entry"),
      ["-"]             = cb("toggle_stage_entry"),   -- Stage / unstage the selected entry.
      ["S"]             = cb("stage_all"),            -- Stage all entries.
      ["U"]             = cb("unstage_all"),          -- Unstage all entries.
      ["X"]             = cb("restore_entry"),        -- Restore entry to the state on the left side.
      ["R"]             = cb("refresh_files"),        -- Update stats and entries in the file list.
      ["<tab>"]         = cb("select_next_entry"),
      ["<s-tab>"]       = cb("select_prev_entry"),
      ["gf"]            = cb("goto_file"),
      ["<C-w><C-f>"]    = cb("goto_file_split"),
      ["<C-w>gf"]       = cb("goto_file_tab"),
      ["i"]             = cb("listing_style"),        -- Toggle between 'list' and 'tree' views
      ["f"]             = cb("toggle_flatten_dirs"),  -- Flatten empty subdirectories in tree listing style.
      ["<leader>e"]     = cb("focus_files"),
      ["<leader>b"]     = cb("toggle_files"),
    },
    file_history_panel = {
      ["g!"]            = cb("options"),            -- Open the option panel
      ["<C-A-d>"]       = cb("open_in_diffview"),   -- Open the entry under the cursor in a diffview
      ["y"]             = cb("copy_hash"),          -- Copy the commit hash of the entry under the cursor
      ["zR"]            = cb("open_all_folds"),
      ["zM"]            = cb("close_all_folds"),
      ["j"]             = cb("next_entry"),
      ["<down>"]        = cb("next_entry"),
      ["k"]             = cb("prev_entry"),
      ["<up>"]          = cb("prev_entry"),
      ["<cr>"]          = cb("select_entry"),
      ["o"]             = cb("select_entry"),
      ["<2-LeftMouse>"] = cb("select_entry"),
      ["<tab>"]         = cb("select_next_entry"),
      ["<s-tab>"]       = cb("select_prev_entry"),
      ["gf"]            = cb("goto_file"),
      ["<C-w><C-f>"]    = cb("goto_file_split"),
      ["<C-w>gf"]       = cb("goto_file_tab"),
      ["<leader>e"]     = cb("focus_files"),
      ["<leader>b"]     = cb("toggle_files"),
    },
    option_panel = {
      ["<tab>"] = cb("select"),
      ["q"]     = cb("close"),
    },
  },
}

require("zen-mode").setup{
  winddow = {
    width = 200,
    backdrop = 0.69
    }
}
require('specs').setup{
    show_jumps  = true,
    min_jump = 5,
    popup = {
        fader = function(blend, cnt)
            if cnt > 100 then
                return 80
            else return nil end
        end,
	resizer = function(width, ccol, cnt)
            if width-cnt > 0 then
                return {width+cnt, ccol}
            else return nil end
        end,
    },
    ignore_filetypes = {},
    ignore_buftypes = {
        nofile = true,
    },
}

require('numb').setup{
   show_numbers = true, -- Enable 'number' for the window while peeking
   show_cursorline = true, -- Enable 'cursorline' for the window while peeking
   number_only = false, -- Peek only when the command is only a number instead of when it starts with a number
}

gps.setup({
	icons = {
		["class-name"] = '🪑',      -- Classes and class-like objects
		["function-name"] = ' ',   -- Functions
		["method-name"] = ' ',     -- Methods (functions inside class-like objects)
		["container-name"] = '🏛️ ',  -- Containers (example: lua tables)
		["tag-name"] = '炙'         -- Tags (example: html tags)
	},
	languages = {},
	separator = ' > ',
  depth = 0,
  depth_limit_indicator = 'ok',
})

-- Statusline
require("lualine").setup({
	sections = {
			lualine_c = {
				{ gps.get_location, cond = gps.is_available },
			}
	}
})


local parser_config = require "nvim-treesitter.parsers".get_parser_configs()
parser_config.crystal = {
  install_info = {
    url = "~/Documents/tree-sitter-crystal", -- local path or git repo
    files = {"src/parser.c"}
  },
  filetype = "cr", -- if filetype does not agrees with parser name
  used_by = {"crystal", "cr"} -- additional filetypes that use this parser
}

require("octo").setup({
default_remote = {"upstream", "origin"}; -- order to try remotes
reaction_viewer_hint_icon = "";         -- marker for user reactions
user_icon = " ";                        -- user icon
timeline_marker = "";                   -- timeline marker
timeline_indent = "2";                   -- timeline indentation
right_bubble_delimiter = "";            -- Bubble delimiter
left_bubble_delimiter = "";             -- Bubble delimiter
github_hostname = "";                    -- GitHub Enterprise host
snippet_context_lines = 4;               -- number or lines around commented lines
file_panel = {
  size = 10,                             -- changed files panel rows
  use_icons = true                       -- use web-devicons in file panel
},
mappings = {
  issue = {
    close_issue = "<space>ic",           -- close issue
    reopen_issue = "<space>io",          -- reopen issue
    list_issues = "<space>il",           -- list open issues on same repo
    reload = "<C-r>",                    -- reload issue
    open_in_browser = "<C-b>",           -- open issue in browser
    copy_url = "<C-y>",                  -- copy url to system clipboard
    add_assignee = "<space>aa",          -- add assignee
    remove_assignee = "<space>ad",       -- remove assignee
    create_label = "<space>lc",          -- create label
    add_label = "<space>la",             -- add label
    remove_label = "<space>ld",          -- remove label
    goto_issue = "<space>gi",            -- navigate to a local repo issue
    add_comment = "<space>ca",           -- add comment
    delete_comment = "<space>cd",        -- delete comment
    next_comment = "]c",                 -- go to next comment
    prev_comment = "[c",                 -- go to previous comment
    react_hooray = "<space>rp",          -- add/remove 🎉 reaction
    react_heart = "<space>rh",           -- add/remove ❤️ reaction
    react_eyes = "<space>re",            -- add/remove 👀 reaction
    react_thumbs_up = "<space>r+",       -- add/remove 👍 reaction
    react_thumbs_down = "<space>r-",     -- add/remove 👎 reaction
    react_rocket = "<space>rr",          -- add/remove 🚀 reaction
    react_laugh = "<space>rl",           -- add/remove 😄 reaction
    react_confused = "<space>rc",        -- add/remove 😕 reaction
  },
  pull_request = {
    checkout_pr = "<space>po",           -- checkout PR
    merge_pr = "<space>pm",              -- merge PR
    list_commits = "<space>pc",          -- list PR commits
    list_changed_files = "<space>pf",    -- list PR changed files
    show_pr_diff = "<space>pd",          -- show PR diff
    add_reviewer = "<space>va",          -- add reviewer
    remove_reviewer = "<space>vd",       -- remove reviewer request
    close_issue = "<space>ic",           -- close PR
    reopen_issue = "<space>io",          -- reopen PR
    list_issues = "<space>il",           -- list open issues on same repo
    reload = "<C-r>",                    -- reload PR
    open_in_browser = "<C-b>",           -- open PR in browser
    copy_url = "<C-y>",                  -- copy url to system clipboard
    add_assignee = "<space>aa",          -- add assignee
    remove_assignee = "<space>ad",       -- remove assignee
    create_label = "<space>lc",          -- create label
    add_label = "<space>la",             -- add label
    remove_label = "<space>ld",          -- remove label
    goto_issue = "<space>gi",            -- navigate to a local repo issue
    add_comment = "<space>ca",           -- add comment
    delete_comment = "<space>cd",        -- delete comment
    next_comment = "]c",                 -- go to next comment
    prev_comment = "[c",                 -- go to previous comment
    react_hooray = "<space>rp",          -- add/remove 🎉 reaction
    react_heart = "<space>rh",           -- add/remove ❤️ reaction
    react_eyes = "<space>re",            -- add/remove 👀 reaction
    react_thumbs_up = "<space>r+",       -- add/remove 👍 reaction
    react_thumbs_down = "<space>r-",     -- add/remove 👎 reaction
    react_rocket = "<space>rr",          -- add/remove 🚀 reaction
    react_laugh = "<space>rl",           -- add/remove 😄 reaction
    react_confused = "<space>rc",        -- add/remove 😕 reaction
  },
  review_thread = {
    goto_issue = "<space>gi",            -- navigate to a local repo issue
    add_comment = "<space>ca",           -- add comment
    add_suggestion = "<space>sa",        -- add suggestion
    delete_comment = "<space>cd",        -- delete comment
    next_comment = "]c",                 -- go to next comment
    prev_comment = "[c",                 -- go to previous comment
    select_next_entry = "]q",            -- move to previous changed file
    select_prev_entry = "[q",            -- move to next changed file
    close_review_tab = "<C-c>",          -- close review tab
    react_hooray = "<space>rp",          -- add/remove 🎉 reaction
    react_heart = "<space>rh",           -- add/remove ❤️ reaction
    react_eyes = "<space>re",            -- add/remove 👀 reaction
    react_thumbs_up = "<space>r+",       -- add/remove 👍 reaction
    react_thumbs_down = "<space>r-",     -- add/remove 👎 reaction
    react_rocket = "<space>rr",          -- add/remove 🚀 reaction
    react_laugh = "<space>rl",           -- add/remove 😄 reaction
    react_confused = "<space>rc",        -- add/remove 😕 reaction
  },
  submit_win = {
    approve_review = "<C-a>",            -- approve review
    comment_review = "<C-m>",            -- comment review
    request_changes = "<C-r>",           -- request changes review
    close_review_tab = "<C-c>",          -- close review tab
  },
  review_diff = {
    add_review_comment = "<space>ca",    -- add a new review comment
    add_review_suggestion = "<space>sa", -- add a new review suggestion
    focus_files = "<leader>e",           -- move focus to changed file panel
    toggle_files = "<leader>b",          -- hide/show changed files panel
    next_thread = "]t",                  -- move to next thread
    prev_thread = "[t",                  -- move to previous thread
    select_next_entry = "]q",            -- move to previous changed file
    select_prev_entry = "[q",            -- move to next changed file
    close_review_tab = "<C-c>",          -- close review tab
    toggle_viewed = "<leader><space>",   -- toggle viewer viewed state
  },
  file_panel = {
    next_entry = "j",                    -- move to next changed file
    prev_entry = "k",                    -- move to previous changed file
    select_entry = "<cr>",               -- show selected changed file diffs
    refresh_files = "R",                 -- refresh changed files panel
    focus_files = "<leader>e",           -- move focus to changed file panel
    toggle_files = "<leader>b",          -- hide/show changed files panel
    select_next_entry = "]q",            -- move to previous changed file
    select_prev_entry = "[q",            -- move to next changed file
    close_review_tab = "<C-c>",          -- close review tab
    toggle_viewed = "<leader><space>",   -- toggle viewer viewed state
  }
}
})

-- barbar
-- INFO: <A> is alt key so i don't foge-- INFO: <A> is alt key so i don't fogett

-- Move to previous/next
map('n', '<A-,>', ':BufferPrevious<CR>', opts)
map('n', '<A-.>', ':BufferNext<CR>', opts)
-- Re-order to previous/next
map('n', '<A-<>', ':BufferMovePrevious<CR>', opts)
map('n', '<A->>', ' :BufferMoveNext<CR>', opts)
-- Goto buffer in position...
map('n', '<A-1>', ':BufferGoto 1<CR>', opts)
map('n', '<A-2>', ':BufferGoto 2<CR>', opts)
map('n', '<A-3>', ':BufferGoto 3<CR>', opts)
map('n', '<A-4>', ':BufferGoto 4<CR>', opts)
map('n', '<A-5>', ':BufferGoto 5<CR>', opts)
map('n', '<A-6>', ':BufferGoto 6<CR>', opts)
map('n', '<A-7>', ':BufferGoto 7<CR>', opts)
map('n', '<A-8>', ':BufferGoto 8<CR>', opts)
map('n', '<A-9>', ':BufferGoto 9<CR>', opts)
map('n', '<A-0>', ':BufferLast<CR>', opts)
-- Close buffer
map('n', '<A-c>', ':BufferClose<CR>', opts)

-- Magic buffer-picking mode
map('n', '<C-p>', ':BufferPick<CR>', opts)
-- Sort automatically by...
map('n', '<Space>bb', ':BufferOrderByBufferNumber<CR>', opts)
map('n', '<Space>bd', ':BufferOrderByDirectory<CR>', opts)
map('n', '<Space>bl', ':BufferOrderByLanguage<CR>', opts)

-- For barbar and nvim-tree
local tree ={}
tree.open = function ()
   require'bufferline.state'.set_offset(31, 'FileTree')
   require'nvim-tree'.find_file(true)
end

tree.close = function ()
   require'bufferline.state'.set_offset(0)
   require'nvim-tree'.close()
end

return tree

