return {
  'chrisgrieser/nvim-scissors',
  dependencies = { 'nvim-telescope/telescope.nvim', 'garymjr/nvim-snippets' },
  opts = {
    snippetDir = '~/.config/nvim/lua/snippets/',
    editSnippetPopup = {
      keymaps = {
        insertNextPlaceholder = '<C-i>',
      },
    },
  },
}
