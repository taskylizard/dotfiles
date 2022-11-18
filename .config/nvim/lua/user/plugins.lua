local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system {
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  }
  print "Installing packer close and reopen Neovim..."
  vim.cmd [[packadd packer.nvim]]
end

vim.cmd [[packadd packer.nvim]]

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]


-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

-- Have packer use a popup window
packer.init {
  display = {
    open_fn = function()
      return require("packer.util").float { border = "rounded" }
    end,
  },
}


packer.startup{{...},
  config = {
    -- Move to lua dir so impatient.nvim can cache it
    compile_path = vim.fn.stdpath('config')..'/lua/packer_compiled.lua'
  }
}
-- Install your plugins here
return packer.startup(function(use)
  -- My plugins here
  use "wbthomason/packer.nvim" -- Have packer manage itself
  use "nvim-lua/popup.nvim" -- An implementation of the Popup API from vim in Neovim
  use "nvim-lua/plenary.nvim" -- Useful lua functions used ny lots of plugins
  use "windwp/nvim-autopairs" -- Autopairs, integrates with both cmp and treesitter
  use "numToStr/Comment.nvim" -- Easily comment stuff
  use "kyazdani42/nvim-web-devicons"
  use "kyazdani42/nvim-tree.lua"
  use "moll/vim-bbye"
  use "akinsho/toggleterm.nvim"
  use "ahmedkhalf/project.nvim"
  use "lewis6991/impatient.nvim"
  use "lukas-reineke/indent-blankline.nvim"
  use "goolord/alpha-nvim"
  use "antoinemadec/FixCursorHold.nvim" -- This is needed to fix lsp doc highlight
  use "folke/which-key.nvim"

  use {'neoclide/coc.nvim', branch = 'release'}
  use 'honza/vim-snippets'
  -- use 'github/copilot.vim'
  -- Usefull Stuff
  -- ediorconfig file
  use 'editorconfig/editorconfig-vim'

  -- Colorschemes
  use "lunarvim/darkplus.nvim"
  use "folke/tokyonight.nvim"

  -- Telescope
  use "nvim-telescope/telescope.nvim"

  -- Treesitter
  use {
    "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate",
  }
  use "JoosepAlviste/nvim-ts-context-commentstring"
  
  use {
      'jedi2610/nvim-rooter.lua',
      config = function() require'nvim-rooter'.setup() end
  }

  use({
    "folke/persistence.nvim",
    event = "BufReadPre", -- this will only start session saving when an actual file was opened
    module = "persistence",
    config = function()
      require("persistence").setup()
    end,
  })

  -- Move fast to lines
  use 'nacro90/numb.nvim'

  -- Function thing
  use {"SmiteshP/nvim-gps",requires = "nvim-treesitter/nvim-treesitter"}

  -- Minimap
  use 'wfxr/minimap.vim'

  -- Autosave
  -- use "Pocco81/AutoSave.nvim"

  -- For Markdown
  use {'iamcco/markdown-preview.nvim', run = 'cd app && yarn install', cmd = 'MarkdownPreview'}

  -- Colorize hex
  use 'norcalli/nvim-colorizer.lua'

  -- Statusline
  use {'nvim-lualine/lualine.nvim',requires = {'kyazdani42/nvim-web-devicons', opt = true}}

  -- tabline plugin
  use {'romgrk/barbar.nvim',requires = {'kyazdani42/nvim-web-devicons'}}

  -- For floating stuff id

  -- Notifications
  use 'rcarriga/nvim-notify'

  -- PEACE
  use "folke/zen-mode.nvim"

  -- Git
  use "lewis6991/gitsigns.nvim"
  use 'kdheepak/lazygit.nvim'
  use 'sindrets/diffview.nvim'

  -- Language specific
  --
  -- Crystal
  use 'spencerwi/crystal.nvim'
  use 'vim-crystal/vim-crystal'

  -- Syntax highlighting for i3
  use 'mboughaba/i3config.vim'

  -- Python
  use 'psf/black'
  use 'nvie/vim-flake8'
  use 'raimon49/requirements.txt.vim'
  use 'rafi/vim-venom'

 -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)
