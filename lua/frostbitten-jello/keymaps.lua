-- <Space> as leader
vim.g.mapleader = ' '

-- Move visual mode selection
vim.keymap.set('v', 'J', ":m '>+1<CR>gv=gv", { desc = 'Move visual mode selection down'})
vim.keymap.set('v', 'K', ":m '<-2<CR>gv=gv", { desc = 'Move visual mode selection up'})

-- Less movement of cursor
vim.keymap.set('n', 'J', 'mzJ`z', { desc = 'Keep cursor on same line during J'})
vim.keymap.set('n', '<C-d>', '<C-d>zz', {desc = 'Less movement of cursor during <C-d>'})
vim.keymap.set('n', '<C-u>', '<C-u>zz', {desc = 'Less movement of cursor during <C-u>'})
vim.keymap.set('n', 'n', 'nzzzv', {desc = 'Less movement of cursor during n'})
vim.keymap.set('n', 'N', 'Nzzzv', {desc = 'Less movement of cursor during N'})

-- Preserve text in buffer while overwriting
vim.keymap.set('x', '<leader>p', [["_dP]], { desc = '[P]reserve text in buffer during paste' })

-- Replace all instances of given word
vim.keymap.set('n', '<leader>sr', [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], { desc = '[S]earch and [R]eplace' })

-- Make the file excutable
vim.keymap.set('n', '<leader>x', '<cmd>!chmod +x %<CR>', { silent = true, desc = 'Make e[x]ecutable' })

-- Disable Q
vim.keymap.set('n', 'Q', '<nop>', { desc = 'Disable Q command'})

-- Clear highlights
vim.keymap.set('n', '<Esc><Esc>', '<cmd>nohl<CR>', { desc = 'Remove highlights'})

-- Commandline mode movement
vim.keymap.set('c', '<C-F>', '<Right>', { desc = 'move [F]orward' })
vim.keymap.set('c', '<C-B>', '<Left>', { desc = 'move [B]ackward' })

-- Buffer navigation
-- vim.keymap.set('n', '<leader>bn', '<cmd>bnext<CR>', { desc = '[B]uffer [N]ext' })
-- vim.keymap.set('n', '<leader>bp', '<cmd>bprevious<CR>', { desc = '[B]uffer [P]revious' })
