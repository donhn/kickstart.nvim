return {
  'catppuccin/nvim',
  name = 'catppuccin',
  -- priority = 1000,
  config = function()
    require('catppuccin').setup {
      integrations = {
        cmp = true,
        gitsigns = true,
        treesitter = true,
        mini = {
          enabled = true,
        },
        indent_blankline = {
          enabled = true,
          scope_color = 'lavender', -- catppuccin color (eg. `lavender`) Default: text
          colored_indent_levels = false,
        },
        which_key = true,
        lsp_trouble = true,
      },
    }
  end,
  init = function()
    -- vim.cmd.colorscheme 'catppuccin-latte'
    vim.api.nvim_set_hl(0, 'NormalFloat', {})
    vim.api.nvim_set_hl(0, 'NormalFloat', { link = 'Normal' })
  end,
}
