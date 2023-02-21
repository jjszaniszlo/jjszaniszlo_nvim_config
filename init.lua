local execute = vim.api.nvim_command
local fn = vim.fn
-- ensure that packer is installed
-- local install_path = fn.stdpath('data')..'/site/pack/packer/opt/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
    -- execute('!git clone https://github.com/wbthomason/packer.nvim '..install_path)
    -- execute 'packadd packer.nvim'
end

require 'plugins'
require 'plugins.autopairs'
require 'plugins.bufferline'
require 'plugins.colour'
require 'plugins.comment'
require 'plugins.lsp-cmp'
require 'plugins.lsp-config'
require 'plugins.lualine'
require 'plugins.luasnip'
require 'plugins.markdown-preview'
require 'plugins.nvim-tree'
-- require 'plugins.presence'
require 'plugins.surround'
require 'plugins.toggleterm'
require 'plugins.treesitter'

require 'general'
require 'bindings'
require 'commands'
