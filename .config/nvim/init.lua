if pcall(require, 'impatient') then
    require('impatient')
    require('impatient').enable_profile()
end

vim.cmd("source ~/.config/nvim/old.vim")

require("user.options")
require("user.keybinds")
require("user.auto")
require("user.plugins")
require("user.telescope")
require("user.treesitter")
require("user.comment")
require("user.lualine")
-- require("user.autosave")
require("user.diffview")
require("user.numb")
require("user.autopairs")
require("user.gitsigns")	
require("user.nvim-tree")
require("user.indentline")
require("user.alpha")
require("user.whichkey")

-- Update whenever plugins.lua is edited
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerCompile
  augroup end
]])

require('packer_compiled')
