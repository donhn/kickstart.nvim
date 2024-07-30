return {
  'stevearc/oil.nvim',
  opts = {
    view_options = {
      show_hideen = true,
    },
    keymaps = {
      ['g?'] = 'actions.show_help',
      ['<CR>'] = 'actions.select',
      -- ["<C-s>"] = "actions.select_vsplit",
      -- ["<C-h>"] = "actions.select_split",
      ['<leader>ot'] = 'actions.select_tab',
      ['<leader>op'] = 'actions.preview',
      ['<leader>oc'] = 'actions.close',
      ['<leader>or'] = 'actions.refresh',
      ['-'] = 'actions.parent',
      ['_'] = 'actions.open_cwd',
      ['`'] = 'actions.cd',
      ['~'] = 'actions.tcd',
      ['gs'] = 'actions.change_sort',
      ['gx'] = 'actions.open_external',
      ['g.'] = 'actions.toggle_hidden',
      ['g\\'] = 'actions.toggle_trash',
    },
  },
  cmd = 'Oil',
  -- Optional dependencies
  dependencies = { 'nvim-tree/nvim-web-devicons' },
}
