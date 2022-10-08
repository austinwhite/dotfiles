local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }

-- buffers
keymap('n', '<TAB>', '<cmd>:bnext<CR>', opts)
keymap('n', '<S-TAB>', '<cmd>:bprevious<CR>', opts)
keymap('n', '<leader>bd', '<cmd>:bd<CR>', opts)

-- split management
keymap('n', '<leader>sv', '<C-w>v', opts) -- new vertical
keymap('n', '<leader>ss', '<C-w>s', opts) -- new horizontal
keymap('n', '<leader>sq', '<C-w>q', opts) -- quit current

keymap('n', '<C-h>', '<C-w>h', opts) -- move left
keymap('n', '<C-j>', '<C-w>j', opts) -- move down
keymap('n', '<C-k>', '<C-w>k', opts) -- move up
keymap('n', '<C-l>', '<C-w>l', opts) -- move right

keymap('n', '<Left>', ':vertical resize +3<CR>', opts)  -- vertical resize
keymap('n', '<Right>', ':vertical resize -3<CR>', opts) -- vertical resize
keymap('n', '<Up>', ':resize +3<CR>', opts)             -- horizontal resize
keymap('n', '<Down>', ':resize -3<CR>', opts)           -- horizontal resize

keymap('n', '<leader>sh', '<C-w>t<C-w>H', opts) -- swap horizontal --> vertical 
keymap('n', '<leader>sk', '<C-w>t<C-w>K', opts) -- swap vertical --> horizontal 

-- telescope pickers
local builtin = require('telescope.builtin')
local extensions = require('telescope').extensions
keymap('n', '<leader>ff', builtin.find_files, {})
keymap('n', '<leader>fw', builtin.live_grep, {})
keymap('n', '<leader>fb', builtin.buffers, {})
keymap('n', '<leader>fh', builtin.help_tags, {})
keymap('n', '<leader>ft', extensions.file_browser.file_browser, {})

-- git fugitive
keymap('n', '<leader>gs', '<cmd>Git<cr>', { desc = 'Git status' })
keymap('n', '<leader>gw', '<cmd>Gwrite<cr>', { desc = 'Git add' })
keymap('n', '<leader>gc', '<cmd>Git commit<cr>', { desc = 'Git commit' })
keymap('n', '<leader>gd', '<cmd>Gdiffsplit<cr>', { desc = 'Git diff' })
keymap('n', '<leader>gpl', '<cmd>Git pull<cr>', { desc = 'Git pull' })
keymap('n', '<leader>gpu', '<cmd>15 split|term git push<cr>', { desc = 'Git push' })
