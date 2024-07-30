return {
  'leath-dub/snipe.nvim',
  config = function()
    local snipe = require 'snipe'
    snipe.setup {
      hints = {
        dictionary = 'asdfgzxcvbqwert',
      },
    }
    vim.keymap.set('n', 'gb', snipe.create_buffer_menu_toggler())
  end,
}
