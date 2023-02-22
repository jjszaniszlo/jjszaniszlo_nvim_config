require 'mason'.setup {}
require 'mason-lspconfig'.setup {
  ensure_installed = { 'lua_ls', 'clangd', 'rust_analyzer', 'html', 'cssls', 'tsserver', 'cmake' },
}

local nvim_lsp = require 'lspconfig'

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require 'cmp_nvim_lsp'.default_capabilities(capabilities)

local servers = { 'lua_ls', 'clangd', 'rust_analyzer', 'html', 'cssls', 'tsserver', 'cmake' }

local lsp_format = require 'lsp-format'
lsp_format.setup {}

do
  for _, lsp in pairs(servers) do
    local attach_func = lsp_format.on_attach
    if (lsp == 'cmake') then
      attach_func = on_attach
    end
    nvim_lsp[lsp].setup {
      on_attach = lsp_format.on_attach,
      capabilities = capabilities,
      flags = {
        debounce_text_changes = 150,
      },
      root_dir = function()
        return vim.loop.cwd()
      end
    }
  end
end
