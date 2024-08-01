--  NOTE: Must happen before plugins are loaded (otherwise wrong leader will be used)
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Set to true if you have a Nerd Font installed and selected in the terminal
vim.g.have_nerd_font = true

-- [[ Setting options ]]
-- Make line numbers default
vim.opt.number = true

-- You can also add relative line numbers, to help with jumping.
--  Experiment for yourself to see if you like it!
vim.opt.relativenumber = true
vim.opt.colorcolumn = '81,101,121'

-- Enable mouse mode, can be useful for resizing splits for example!
vim.opt.mouse = 'a'

-- Don't show the mode, since it's already in the status line
vim.opt.showmode = false

-- Sync clipboard between OS and Neovim.
--  Schedule the setting after `UiEnter` because it can increase startup-time.
--  Remove this option if you want your OS clipboard to remain independent.
--  See `:help 'clipboard'`
vim.schedule(function()
  vim.opt.clipboard = 'unnamedplus'
end)

-- Enable break indent
vim.opt.breakindent = true

-- Save undo history
vim.opt.undofile = true

-- Case-insensitive searching UNLESS \C or one or more capital letters in the search term
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Keep signcolumn on by default
vim.opt.signcolumn = 'yes'

-- Decrease update time
vim.opt.updatetime = 250

-- Decrease mapped sequence wait time
-- Displays which-key popup sooner
vim.opt.timeoutlen = 300

-- Configure how new splits should be opened
vim.opt.splitright = true
vim.opt.splitbelow = true

-- Sets how neovim will display certain whitespace characters in the editor.
vim.opt.list = true
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }
vim.opt.expandtab = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4

-- Preview substitutions live, as you type!
vim.opt.inccommand = 'split'

-- Show which line your cursor is on
vim.opt.cursorline = true

-- Minimal number of screen lines to keep above and below the cursor.
vim.opt.scrolloff = 10


-- [[Autocmds]]
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not vim.uv.fs_stat(lazypath) then
  local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
  local out = vim.fn.system { 'git', 'clone', '--filter=blob:none', '--branch=stable', lazyrepo, lazypath }
  if vim.v.shell_error ~= 0 then
    error('Error cloning lazy.nvim:\n' .. out)
  end
end ---@diagnostic disable-next-line: undefined-field

-- Persisted
local persisted_group = vim.api.nvim_create_augroup('PersistedHooks', {})

vim.api.nvim_create_autocmd({ 'User' }, {
  pattern = 'PersistedTelescopeLoadPost',
  group = persisted_group,
  callback = function(session)
    vim.fn.system('git -C "$HOME/' .. session.data.dir_path .. '" switch ' .. session.data.branch)
  end,
})

vim.api.nvim_create_autocmd({ 'User' }, {
  pattern = 'PersistedTelescopeLoadPre',
  group = persisted_group,
  callback = function(session)
    vim.api.nvim_input '<ESC>:wa<CR>'

    -- Save the currently loaded session using a global variable
    if vim.g.persisted_loaded_session then
      require('persisted').save { session = vim.g.persisted_loaded_session }
    end

    -- Delete all of the open buffers
    vim.api.nvim_input '<ESC>:%bd!<CR>'
  end,
})

-- [[Lazy]]
vim.opt.rtp:prepend(lazypath)
require('lazy').setup {
  { import = 'plugins' },
  { import = 'colorschemes' },
}

-- [[Colorscheme / Theme]]
vim.opt.background = 'light'
-- vim.cmd.colorscheme 'caret'
vim.cmd.colorscheme 'catppuccin'

vim.api.nvim_set_hl(0, 'NormalFloat', {})
vim.api.nvim_set_hl(0, 'NormalFloat', { link = 'Normal' })

-- [[Keymaps]]
require 'mappings'

-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et
