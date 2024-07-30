return {
  'leath-dub/snipe.nvim',
  opts = {
    hints = {
      dictionary = 'asdfgzxcvbqwert',
    },
  },
  init = function()
    local snipe = require 'snipe'
    vim.keymap.set('n', 'gb', snipe.create_buffer_menu_toggler())
  end,
}
