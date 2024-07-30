-- A simple statusline/winbar component that uses LSP to show your current code context.
return {
  'SmiteshP/nvim-navic',
  opts = {
    lsp = {
      auto_attach = true,
    },
  },
}
