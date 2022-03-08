-- --------------------------------------------------------------------------- -
--                                                                             -
--                                                      :::      ::::::::      -
--   plugins.lua                                      :+:      :+:    :+:      -
--                                                  +:+ +:+         +:+        -
--   By: taskylizard                              +#+  +:+       +#+           -
--                                              +#+#+#+#+#+   +#+              -
--   Created: 2021/12/13 12:10:54 by taskylizard     #+#    #+#                -
--   Updated: 2021/12/13 12:10:54 by taskylizard    ###   ########.fr          -
--                                                                             -
-- --------------------------------------------------------------------------- -

local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
  print("Installing packer close and reopen Neovim...")
end

vim.cmd [[packadd packer.nvim]]

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

-- Have packer use a popup window
packer.init({
    display = {
      open_fn = function()
        return require('packer.util').float({ border = 'single' })
      end
    }
  }
)

packer.startup{{...},
  config = {
    -- Move to lua dir so impatient.nvim can cache it
    compile_path = vim.fn.stdpath('config')..'/lua/packer_compiled.lua'
  }
}

return packer.startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  use 'Olical/aniseed'

  -- General Stuff
  --
  -- LSP stuff
  -- completion stuff
  use {'neoclide/coc.nvim', branch = 'release'}
  use 'honza/vim-snippets'


  -- Treesitter stuff
  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
  use 'p00f/nvim-ts-rainbow'

  -- Telescope stuff
  use 'nvim-telescope/telescope.nvim'
  use 'fannheyward/telescope-coc.nvim'
 -- use 'nvim-telescope/telescope-media-files.nvim' DOES NOT WORK FOR ME I DON'T KNOW WHY AAAA
  use 'nvim-telescope/telescope-project.nvim'
  use 'nvim-telescope/telescope-packer.nvim'

  -- INFO: THE REAL SHIT RIGHT HERE
  use 'github/copilot.vim'

  -- Usefull Stuff
  --

  -- ediorconfig file
  use 'editorconfig/editorconfig-vim'

  -- Git stuff
  use {'lewis6991/gitsigns.nvim',requires = {'nvim-lua/plenary.nvim'},}
  use 'kdheepak/lazygit.nvim'
  use 'sindrets/diffview.nvim'

  -- Autocomplete curlies
  use 'windwp/nvim-autopairs'

  -- Persistence owo
  use({
    "folke/persistence.nvim",
    event = "BufReadPre", -- this will only start session saving when an actual file was opened
    module = "persistence",
    config = function()
      require("persistence").setup()
    end,
  })

  -- File Manager
  use {'kyazdani42/nvim-tree.lua',requires = {'kyazdani42/nvim-web-devicons',}}

  -- Cumment
  use "terrortylor/nvim-comment"

  -- Move fast to lines
  use 'nacro90/numb.nvim'

  -- Function thing
  use {"SmiteshP/nvim-gps",requires = "nvim-treesitter/nvim-treesitter"}

  -- Minimap
  use 'wfxr/minimap.vim'

  -- Autosave
  use "Pocco81/AutoSave.nvim"

  -- For Markdown
  use {'iamcco/markdown-preview.nvim', run = 'cd app && yarn install', cmd = 'MarkdownPreview'}

  -- Colorize hex
  use 'norcalli/nvim-colorizer.lua'

  -- Statusline
  use {'nvim-lualine/lualine.nvim',requires = {'kyazdani42/nvim-web-devicons', opt = true}}

  -- tabline plugin
  use {'romgrk/barbar.nvim',requires = {'kyazdani42/nvim-web-devicons'}}

  -- For floating stuff idk
   use {
    "blackCauldron7/surround.nvim",
    config = function()
      require"surround".setup {mappings_style = "surround"}
    end
  }

  -- Project manager
  use 'ahmedkhalf/project.nvim'

  -- Notifications
  use 'rcarriga/nvim-notify'

  -- PEACE
  use "folke/zen-mode.nvim"

  -- header
  use 'abellaismail7/42header.nvim'

  -- find and replace
  use 'ray-x/sad.nvim'
  use 'ray-x/guihua.lua'

  -- github
  use 'pwntester/octo.nvim'



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

  -- Dependencies
  --
  use "nvim-lua/popup.nvim" -- An implementation of the Popup API from vim in Neovim
  use "nvim-lua/plenary.nvim" -- Useful lua functions used ny lots of plugins

  -- Fixes/Tweaks
  --
  use 'antoinemadec/FixCursorHold.nvim'
  use 'lewis6991/spaceless.nvim'
  use 'karb94/neoscroll.nvim'
  use {'edluffy/specs.nvim'}
  use 'lukas-reineke/indent-blankline.nvim'
  use 'lewis6991/impatient.nvim'
  use {
    "max397574/better-escape.nvim",
    config = function()
      require("better_escape").setup()
    end,
  }
  use {
    'goolord/alpha-nvim',
    requires = { 'kyazdani42/nvim-web-devicons' },
    config = function ()
      require'alpha'.setup(require'alpha.themes.startify'.opts)
    end
  }
  -- Theming
  --
  -- Backup themes
  use 'kvrohit/substrata.nvim'
  use 'folke/tokyonight.nvim'

  -- Themer
  use({
	  "narutoxy/themer.lua",
	  branch = "dev",	-- I recommend dev branch because it has more plugin support currently
	  module = "themer",	-- load it as fast as possible
  })


  if PACKER_BOOTSTRAP then
    require('packer').sync()
  end
end)
