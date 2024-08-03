local map = vim.keymap.set

--------------------------------------------------------------------------------
-- General
--------------------------------------------------------------------------------

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

local function toggleBackground()
  local background = vim.api.nvim_get_option_value('background', {})
  if background == 'dark' then
    vim.api.nvim_set_option_value('background', 'light', {})
  else
    vim.api.nvim_set_option_value('background', 'dark', {})
  end
end

map('n', '<leader>tb', toggleBackground, { desc = 'Toggle background light/dark', silent = true })

map('n', '<leader>nt', ':tabnew<CR>', { desc = 'New Tab', silent = true })

--------------------------------------------------------------------------------
-- NvimTree
--------------------------------------------------------------------------------
map('n', '<C-n>', ':NvimTreeToggle<CR>', { desc = 'Open or close NvimTree', silent = true })
map('n', '<leader>e', ':NvimTreeFocus<CR>', { desc = 'Focus NvimTree', silent = true })

--------------------------------------------------------------------------------
-- Lazygit
--------------------------------------------------------------------------------
map('n', '<leader>gg', ':LazyGit<CR>', { desc = 'Lazygit', silent = true })

--------------------------------------------------------------------------------
-- Scissors
--------------------------------------------------------------------------------
-- Keymaps in scissors popup window
-- <C-i>: insert the next placeholder such as ${1:placeholder} in the snippet body
-- <C-d>: duplicate a snippet
map({ 'n', 'x' }, '<leader>sa', function()
  require('scissors').addNewSnippet()
end, { desc = '[S]nippet [A]dd', silent = true })

map('n', '<leader>se', function()
  require('scissors').editSnippet()
end, { desc = '[S]nippet [E]dit', silent = true })

--------------------------------------------------------------------------------
-- Persisted
--------------------------------------------------------------------------------
map('n', '<leader>fs', ':SessionSave<CR>', { desc = 'Save session' })
map('n', '<leader>fl', ':Telescope persisted<CR>', { desc = '[F]ind and [Load] Sessions' })

--------------------------------------------------------------------------------
-- Telescope
--------------------------------------------------------------------------------

local builtin = require 'telescope.builtin'
map('n', '<leader>fh', builtin.help_tags, { desc = '[F]ind [H]elp' })
map('n', '<leader>fk', builtin.keymaps, { desc = '[F]ind [K]eymaps' })
map('n', '<leader>ff', builtin.find_files, { desc = '[F]ind [F]iles' })
-- map('n', '<leader>fs', builtin.builtin, { desc = '[F]ind [S]elect Telescope' })
-- map('n', '<leader>fz', builtin.grep_string, { desc = '[F]ind current [W]ord' })
map('n', '<leader>fw', builtin.live_grep, { desc = '[F]ind by [G]rep' })
map('n', '<leader>fd', builtin.diagnostics, { desc = '[F]ind [D]iagnostics' })
map('n', '<leader>fr', builtin.resume, { desc = '[F]ind [R]esume' })
map('n', '<leader>f.', builtin.oldfiles, { desc = '[F]ind Recent Files ("." for repeat)' })
map('n', '<leader>fb', builtin.buffers, { desc = '[F]ind existing buffers' })
map('n', '<leader>fc', builtin.colorscheme, { desc = '[F]ind colorschemes' })

-- Slightly advanced example of overriding default behavior and theme
map('n', '<leader>fz', function()
  -- You can pass additional configuration to Telescope to change the theme, layout, etc.
  builtin.current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
    winblend = 10,
    previewer = false,
  })
end, { desc = 'Fuzzily search in current buffer' })

-- It's also possible to pass additional configuration options.
--  See `:help telescope.builtin.live_grep()` for information about particular keys
map('n', '<leader>fB', function()
  builtin.live_grep {
    grep_open_files = true,
    prompt_title = 'Live Grep in Open Files',
  }
end, { desc = 'Search in open files.' })
