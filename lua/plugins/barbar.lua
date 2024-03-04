return {
  'romgrk/barbar.nvim',
  dependencies = {
    'lewis6991/gitsigns.nvim',
    'nvim-tree/nvim-web-devicons',
  },
  init = function() vim.g.barbar_auto_setup = true end,
  opts = {
    auto_hide = 1,
    sidebar_filetypes = {
      ['neo-tree'] = { event = 'BufWipeout' },
    },
    exclude_ft = { 'qf' },
    icons = {},
    no_name_title = 'New file'
  },
}
