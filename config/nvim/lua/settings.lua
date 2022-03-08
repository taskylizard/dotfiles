-- --------------------------------------------------------------------------- -
--                                                                             -
--                                                      :::      ::::::::      -
--   settings.lua                                     :+:      :+:    :+:      -
--                                                  +:+ +:+         +:+        -
--   By: taskylizard                              +#+  +:+       +#+           -
--                                              +#+#+#+#+#+   +#+              -
--   Created: 2021/12/13 12:11:16 by taskylizard     #+#    #+#                -
--   Updated: 2021/12/13 12:11:16 by taskylizard    ###   ########.fr          -
--                                                                             -
-- --------------------------------------------------------------------------- -

local options = {
  syntax = "true",
  backup = false,                          -- creates a backup file
  clipboard = "unnamedplus",               -- allows neovim to access the system clipboard
  cmdheight = 2,                           -- more space in the neovim command line for displaying messages
  conceallevel = 0,                        -- so that `` is visible in markdown files
  fileencoding = "utf-8",                  -- the encoding written to a file
  hlsearch = true,                         -- highlight all matches on previous search pattern
  ignorecase = true,                       -- ignore case in search patterns
  mouse = "a",                             -- allow the mouse to be used in neovim
  pumheight = 10,                          -- pop up menu height
  showmode = false,                        -- we don't need to see things like -- INSERT -- anymore
  showtabline = 2,                         -- always show tabs
  smartcase = true,                        -- smart case
  smartindent = true,                      -- make indenting smarter again
  splitbelow = true,                       -- force all horizontal splits to go below current window
  splitright = true,                       -- force all vertical splits to go to the right of current window
  swapfile = false,                        -- creates a swapfile
  termguicolors = true,
  timeout = false,                        -- set term gui colors (most terminals support this)
  timeoutlen = 100,                        -- time to wait for a mapped sequence to complete (in milliseconds)
  undofile = true,                         -- enable persistent undo
  updatetime = 300,                        -- faster completion (4000ms default)
  writebackup = false,                     -- if a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited
  expandtab = true,                        -- convert tabs to spaces
  shiftwidth = 2,                          -- the number of spaces inserted for each indentation
  tabstop = 2,                             -- insert 2 spaces for a tab
  cursorline = true,                       -- highlight the current line
  number = true,                           -- set numbered lines
  relativenumber = true,                  -- set relative numbered lines
  numberwidth = 4,                         -- set number column width to 2 {default 4}
  signcolumn = "number",                      -- always show the sign column, otherwise it would shift the text each time
  wrap = false,                            -- display lines as one long line
  scrolloff = 8,                           -- is one of my fav
  sidescrolloff = 8,
  guifont = "monospace:h17",               -- the font used in graphical neovim applications
}

local cmd = vim.cmd
local opt = vim.opt
local cmd = vim.cmd
local g = vim.g
local o = vim.o
local fn = vim.fn
local env = vim.env

opt.shortmess:append "c"

for k, v in pairs(options) do
  opt[k] = v
end

vim.cmd "set whichwrap+=<,>,[,],h,l"

vim.g.tokyonight_sidebars = { "qf", "vista_kind", "terminal", "packer" }
vim.g.tokyonight_style = "night"
vim.g.tokyonight_italic_functions = 1
vim.cmd "colorscheme tokyonight"


-- code folding settings
cmd [[set foldmethod=expr]] -- use treesitter folding support
cmd [[set foldexpr=nvim_treesitter#foldexpr()]]
opt.foldlevelstart = 99
opt.foldnestmax = 10 -- deepest fold is 10 levels
opt.foldenable = false -- don't fold by default
opt.foldlevel = 1
