local keymap = vim.keymap.set

-- bufferline
keymap('n', '<tab>', '<cmd> BufferLineCycleNext <cr>')
keymap('n', '<s-tab>', '<cmd> BufferLineCyclePrev <cr>')
keymap('n', 'm.', '<cmd> BufferLineMoveNext <cr>')
keymap('n', 'm,', '<cmd> BufferLineMovePrev <cr>')

-- lsp bindings
keymap('n', 'gD', vim.lsp.buf.declaration)
keymap('n', 'gd', vim.lsp.buf.definition)
keymap('n', 'K', vim.lsp.buf.hover)
keymap('n', 'gi', vim.lsp.buf.implementation)
keymap('n', '<space>rn', vim.lsp.buf.rename)
keymap('n', '<space>ca', vim.lsp.buf.code_action)
keymap('n', 'gr', vim.lsp.buf.references)
keymap('n', '<space>e', vim.diagnostic.open_float)
keymap('n', '<space>q', vim.diagnostic.setloclist)
keymap('n', '<c-k>', vim.lsp.buf.signature_help)
keymap('n', '<c-n>', vim.diagnostic.goto_prev)
keymap('n', '<c-p>', vim.diagnostic.goto_next)

-- lsp diagnostics
keymap('n', '<leader>dd', '<cmd> ToggleDiag <cr>')

-- nvim tree
keymap('n', '<leader>e', '<cmd> NvimTreeToggle <cr>')

-- Neoformat
keymap('n', '<leader>p', '<cmd> NeoFormat')

-- other
keymap('n', '<leader><space>', '<cmd> noh <cr>')        -- disable highlighting
keymap('n', '<leader>cc', '<cmd> ColorizerToggle <cr>') -- colorizer toggle
keymap('n', '<leader>q', '<cmd> :bd <cr>')                -- close buffer
keymap('n', '<leader>n', '<cmd> enew <cr>')

vim.cmd(':tnoremap <Esc><Esc> <c-\\><c-n>')

vim.cmd[[
  nnoremap <C-J> <C-W><C-J>
  nnoremap <C-K> <C-W><C-K>
  nnoremap <C-L> <C-W><C-L>
  nnoremap <C-H> <C-W><C-H>
]]
