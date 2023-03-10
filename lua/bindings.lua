local keymap = vim.keymap.set
keymap = vim.keymap.set

-- Telescope bindings
function _find_files()
  local is_git = os.execute('git status &>/dev/null')
  if is_git == 0 then
    vim.cmd(':Telescope git_files')
  else
    vim.cmd(':Telescope find_files')
  end
end

keymap('n', '<Leader>f', _find_files)
keymap('n', '<Leader>o', '<cmd> Telescope oldfiles <cr>')
keymap('n', '<Leader>s', '<cmd> Telescope live_grep <cr>')

-- Telescope commands
local commands_table = {
  Tff = 'find_files',
  Tof = 'oldfiles',
  Tlg = 'live_grep',
  Tsh = 'search_history',
  Tqf = 'quickfix',
  Tvo = 'vim_options',
  Tss = 'spell_suggest',
  Treg = 'registers',
  Tcmd = 'commands',
  Thlp = 'help_tags',
  Tman = 'man_pages',
  Tkey = 'keymaps',
  Tcol = 'colorscheme',
  Tacmd = 'autocommands',
  Tgstr = 'grep_string',
  Tlrf = 'lsp_references',
  Tlds = 'lsp_document_symbols',
  Tlws = 'lsp_workspace_symbols',
  Tlca = 'lsp_code_actions',
  Tltd = 'lsp_type_definitions',
  Tld = 'diagnostics',
  Tli = 'lsp_implementations',
  Tld = 'lsp_definitions',
  Tgc = 'git_commits',
  Tgb = 'git_branches',
  Tgs = 'git_status',
  Tgf = 'git_files',
}

do
  for cmd, act in pairs(commands_table) do
    vim.cmd('command! ' .. cmd .. ' :Telescope ' .. act)
  end
end

-- bufferline

keymap('n', '<tab>', '<cmd> BufferLineCycleNext <cr>')
keymap('n', '<s-tab>', '<cmd> BufferLineCyclePrev <cr>')
keymap('n', 'm.', '<cmd> BufferLineMoveNext <cr>')
keymap('n', 'm,', '<cmd> BufferLineMovePrev <cr>')

-- colorizer
keymap('n', '<leader>cc', '<cmd> ColorizerToggle <cr>')

-- lazy git
keymap('n', '<Leader>gg', '<cmd> LazyGit <cr>')

-- lsp bindings
keymap('n', 'gD', vim.lsp.buf.declaration)
keymap('n', 'gd', vim.lsp.buf.definition)
keymap('n', 'K', vim.lsp.buf.hover)
keymap('n', 'gi', vim.lsp.buf.implementation)
keymap("n", "<space>wa", vim.lsp.buf.add_workspace_folder)
keymap("n", "<space>wr", vim.lsp.buf.remove_workspace_folder)
keymap("n", "<space>wl", function()
  print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
end)
keymap('n', '<space>rn', vim.lsp.buf.rename)
keymap('n', '<space>ca', vim.lsp.buf.code_action)
keymap("n", "<space>D", vim.lsp.buf.type_definition)
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

-- other
keymap('n', '<leader><space>', '<cmd> noh <cr>') -- disable highlighting
keymap('n', '<leader>cc', '<cmd> ColorizerToggle <cr>') -- colorizer toggle
keymap('n', '<leader>q', '<cmd> :bd <cr>') -- close buffer
keymap('n', '<leader>n', '<cmd> enew <cr>')

-- terminal escape to normal
vim.cmd(':tnoremap <Esc><Esc> <c-\\><c-n>')

-- swap buffers
local swapbuffers = require 'swap-buffers'
keymap('n', '<C-S-H>', function() swapbuffers.swap_buffers 'h' end)
keymap('n', '<C-S-J>', function() swapbuffers.swap_buffers 'j' end)
keymap('n', '<C-S-K>', function() swapbuffers.swap_buffers 'k' end)
keymap('n', '<C-S-l>', function() swapbuffers.swap_buffers 'l' end)

-- buffer movement
vim.cmd [[
  nnoremap <C-J> <C-W><C-J>
  nnoremap <C-K> <C-W><C-K>
  nnoremap <C-L> <C-W><C-L>
  nnoremap <C-H> <C-W><C-H>
]]
