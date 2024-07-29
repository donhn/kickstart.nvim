local map = vim.keymap.set

-- General
map('n', '<C-c>', '<cmd>%y+<CR>', { desc = 'Copy whole file' })
map('n', '<leader>n', '<cmd>set nu!<CR>', { desc = 'Toggle line numbers' })
map('n', '<leader>rn', '<cmd>set rnu!<CR>', { desc = 'Toggle relative numers' })
map('n', '<C-h>', ':vertical resize -5<CR>', { desc = 'reduce vertical size' })
map('n', '<C-l>', ':vertical resize +5<CR>', { desc = 'increase vertical size' })
map('n', '<C-j>', ':horizontal resize -5<CR>', { desc = 'decrease horizontal size' })
map('n', '<C-k>', ':horizontal resize +5<CR>', { desc = 'increase horizontal size' })

map({ 'n', 'v' }, 'x', '"_x', { desc = 'blackhole delete' })
map('n', '<leader>gg', ':LazyGit<CR>', { desc = 'LazyGit' })

-- NvimTree
map('n', '<C-n>', ':NvimTreeToggle<cr>', { desc = 'Open or close NvimTree' })
map('n', '<leader>e', ':NvimTreeFocus<cr>', { desc = 'Focus NvimTree' })

-- Lazygit
map('n', '<leader>gg', ':LazyGit<cr>', { desc = 'Lazygit' })
