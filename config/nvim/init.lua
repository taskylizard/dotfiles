-- Load plugins/packer so i don't die
if pcall(require, 'impatient') then
    require('impatient')
    require('impatient').enable_profile()
end

require('plugins')
require('settings')
require('pluginsettings')

-- TODO: don't make these shit, source for now
vim.cmd "source ~/.config/nvim/core/settings.vim"
vim.cmd "source ~/.config/nvim/core/keybinds.vim"

-- Update whenever plugins.lua is edited
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerCompile
  augroup end
]])

require('packer_compiled')
if pcall(require, 'aniseed') then
  require('aniseed').init()
end
