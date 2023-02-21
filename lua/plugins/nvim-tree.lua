require 'nvim-tree'.setup {
  disable_netrw      = true,
  hijack_netrw       = true,
  open_on_setup      = false,
  ignore_ft_on_setup = {},
  open_on_tab        = false,
  hijack_cursor      = false,
  update_cwd         = false,

  diagnostics = {
    enable = false,
  },
  actions = {
    open_file = {
      quit_on_open = true,
    },
  },
  update_focused_file = {
    enable      = false,
    update_cwd  = false,
    ignore_list = {},
  },
  system_open = {
    cmd  = nil,
    args = {},
  },
  view = {
    width = 24,
    side  = 'left',
    mappings = {
      custom_only = false,
      list = {
        {
          key    = '<leader>v',
          action = 'vsplit',
        },
        {
          key    = '<leader>x',
          action = 'split',
        }
      },
    },
  }
}
