local map = vim.keymap.set

-- General

-- Clear highlights on search when pressing <Esc> in normal mode
--  See `:help hlsearch`
map('n', '<Esc>', '<cmd>nohlsearch<CR>')

map('n', '<C-c>', '<cmd>%y+<CR>', { desc = 'Copy whole file', silent = true })
map('n', '<leader>n', '<cmd>set nu!<CR>', { desc = 'Toggle line numbers', silent = true })
map('n', '<leader>rn', '<cmd>set rnu!<CR>', { desc = 'Toggle relative numers', silent = true })
map('n', '<C-h>', ':vertical resize -5<CR>', { desc = 'reduce vertical size', silent = true })
map('n', '<C-l>', ':vertical resize +5<CR>', { desc = 'increase vertical size', silent = true })
map('n', '<C-j>', ':horizontal resize -5<CR>', { desc = 'decrease horizontal size', silent = true })
map('n', '<C-k>', ':horizontal resize +5<CR>', { desc = 'increase horizontal size', silent = true })

map({ 'n', 'v' }, 'x', '"_x', { desc = 'blackhole delete' })
map('n', '<leader>x', ':bd<CR>', { desc = 'close current buffers' })
map('n', '<leader>X', ':%bd<CR>', { desc = 'close all buffers' })

-- NvimTree
map('n', '<C-n>', ':NvimTreeToggle<CR>', { desc = 'Open or close NvimTree', silent = true })
map('n', '<leader>e', ':NvimTreeFocus<CR>', { desc = 'Focus NvimTree', silent = true })

-- Lazygit
map('n', '<leader>gg', ':LazyGit<CR>', { desc = 'Lazygit', silent = true })
