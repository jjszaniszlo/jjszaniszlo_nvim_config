require 'packer'.startup(function()
  -- packer
  use 'wbthomason/packer.nvim'

  -- lsp + related
  use 'neovim/nvim-lspconfig'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/nvim-cmp'
  use 'williamboman/nvim-lsp-installer'

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


  -- functional
  use 'L3MON4D3/LuaSnip'
  use 'akinsho/nvim-toggleterm.lua'
  use 'windwp/nvim-autopairs'
  use 'norcalli/nvim-colorizer.lua'
  use 'terrortylor/nvim-comment'

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

  use{
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
