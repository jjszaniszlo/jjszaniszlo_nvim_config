require 'packer'.startup(function()
  -- packer
  use 'wbthomason/packer.nvim'

  -- lsp + related
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/nvim-cmp'
  use 'williamboman/mason.nvim'
  use 'williamboman/mason-lspconfig.nvim'
  use 'neovim/nvim-lspconfig'

  -- aesthetic
  use 'onsails/lspkind-nvim'
  use 'rebelot/kanagawa.nvim'
  use 'WhoIsSethDaniel/toggle-lsp-diagnostics.nvim'
  use 'sitiom/nvim-numbertoggle'
  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true }
  }
  use 'andweeb/presence.nvim'
  use 'tikhomirov/vim-glsl'
  use {
    'lewis6991/gitsigns.nvim',
    requires = {
      'nvim-lua/plenary.nvim',
    },
  }
  use 'lukas-reineke/lsp-format.nvim'

  -- functional
  use 'L3MON4D3/LuaSnip'
  use 'akinsho/nvim-toggleterm.lua'
  use 'windwp/nvim-autopairs'
  use 'norcalli/nvim-colorizer.lua'
  use 'terrortylor/nvim-comment'
  use 'kdheepak/lazygit.nvim'

  -- Telescope
  use {
    'nvim-telescope/telescope.nvim',
    requires = {
      'nvim-lua/popup.nvim',
      'nvim-lua/plenary.nvim',
    },
  }

  use {
    'nvim-telescope/telescope-fzf-native.nvim',
    run = 'make',
  }

  -- treesitter
  use {
    'nvim-treesitter/nvim-treesitter',
    run = function()
      vim.cmd['TSUpdate']()
    end
  }

  use 'nvim-treesitter/nvim-treesitter-refactor'
  use 'windwp/nvim-ts-autotag'
  use {
    'nvim-treesitter/nvim-treesitter-textobjects',
    after = 'nvim-treesitter',
    requires = 'nvim-treesitter/nvim-treesitter',
  }

  use {
    'kylechui/nvim-surround',
    tag = '*',
    config = function()
    end,
  }

  use {
    'akinsho/bufferline.nvim',
    tag = 'v3.*',
    requires = 'nvim-tree/nvim-web-devicons'
  }

  use {
    'kyazdani42/nvim-tree.lua',
    requires = 'kyazdani42/nvim-web-devicons',
  }

  use({
    'iamcco/markdown-preview.nvim',
    run = function() vim.fn['mkdp#util#install']() end,
    setup = require 'plugins.markdown-preview',
    ft = {
      'markdown',
    },
  })
end)
