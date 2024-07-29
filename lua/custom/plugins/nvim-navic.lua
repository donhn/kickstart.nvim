-- A simple statusline/winbar component that uses LSP to show your current code context.
return {
  'SmiteshP/nvim-navic',
  config = function()
    require('nvim-navic').setup {
      lsp = {
        auto_attach = true,
      },
    }
  end,
}
