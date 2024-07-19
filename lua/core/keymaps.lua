-- <Space> as leader
vim.g.mapleader = ' '

-- TIP: Disable arrow keys in normal mode
vim.keymap.set('n', '<left>', '<cmd>echo "Use h to move!!"<CR>')
vim.keymap.set('n', '<right>', '<cmd>echo "Use l to move!!"<CR>')
vim.keymap.set('n', '<up>', '<cmd>echo "Use k to move!!"<CR>')
vim.keymap.set('n', '<down>', '<cmd>echo "Use j to move!!"<CR>')

-- Move visual mode selection
vim.keymap.set('v', 'J', ":m '>+1<CR>gv=gv", { desc = 'Move visual mode selection down' })
vim.keymap.set('v', 'K', ":m '<-2<CR>gv=gv", { desc = 'Move visual mode selection up' })

-- less movement of cursor
vim.keymap.set('n', 'J', 'mzJ`z', { desc = 'keep cursor on same line during j' })
vim.keymap.set('n', '<c-d>', '<c-d>zz', { desc = 'less movement of cursor during <c-d>' })
vim.keymap.set('n', '<c-u>', '<c-u>zz', { desc = 'less movement of cursor during <c-u>' })
vim.keymap.set('n', 'n', 'nzzzv', { desc = 'less movement of cursor during n' })
vim.keymap.set('n', 'n', 'nzzzv', { desc = 'less movement of cursor during n' })
vim.keymap.set('n', '{', '{zz', { desc = 'sentence jumps backward with less cursor motion' })
vim.keymap.set('n', '}', '}zz', { desc = 'sentence jumps forward with less cursor motion' })
vim.keymap.set('v', 'y', 'ygv<ESC>', { desc = 'Yank and stay where the cursor is at the end' })

-- Preserve text in buffer while overwriting
vim.keymap.set('x', '<leader>p', [["_dP]], { desc = '[P]reserve text in buffer during paste' })

-- Replace all instances of given word
vim.keymap.set('n', '<leader>rr', [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]],
  { desc = '[S]earch and [R]eplace' })

-- Make the file excutable
vim.keymap.set('n', '<leader>x', '<cmd>!chmod +x %<CR>', { silent = true, desc = 'Make e[x]ecutable' })

-- Disable Q
vim.keymap.set('n', 'Q', '<nop>', { desc = 'Disable Q command' })

-- Clear highlights
vim.keymap.set({ 'n' }, '<Esc>', '<CMD>nohlsearch<CR>', { desc = 'Remove highlights' })

-- Commandline mode movement
vim.keymap.set('c', '<C-F>', '<Right>', { desc = 'move [F]orward' })
vim.keymap.set('c', '<C-B>', '<Left>', { desc = 'move [B]ackward' })

-- Window navigation
vim.keymap.set("n", "<A-h>", "<C-w>h")
vim.keymap.set("n", "<A-j>", "<C-w>j")
vim.keymap.set("n", "<A-k>", "<C-w>k")
vim.keymap.set("n", "<A-l>", "<C-w>l")

-- Buffer navigation
vim.keymap.set('n', '<S-TAB>', '<cmd>bprevious<CR>', { desc = '[b]uffer [p]revious' })
vim.keymap.set('n', '<TAB>', '<cmd>bnext<CR>', { desc = '[b]uffer [n]ext' })
vim.keymap.set('n', '<leader>bd', '<cmd>bdelete<CR>', { desc = '[b]uffer [d]elete' })

vim.keymap.set('n', '<leader>af', '<CMD>Format<CR>', { desc = '[a]djust [f]ormatting' })

vim.keymap.set('n', '<leader>yc', '<CMD>let @+=@\"<CR>', { desc = '[y]ank to [c]lipboard' })
vim.keymap.set('n', '<leader>cy', '<CMD>let @\"=@+<CR>', { desc = '[c]lipboard to [c]ank' })

vim.keymap.set('n', '<leader>sk', '<CMD>Telescope keymaps<CR>', { desc = '[s]Show [k]eymaps' })
vim.keymap.set('n', '<leader>sl', '<CMD>Lazy<CR>', { desc = '[s]how [l]azy' })

vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })
vim.keymap.set('n', '<leader>fe', '<CMD>Neotree float toggle %:p:h reveal_force_cwd<CR>', { desc = '[f]ile [e]xplorer' })

-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.highlight.on_yank()`
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

vim.keymap.set('n', '<leader>rf', function()
  local current_buf_wd = vim.fn.expand("%:p:h")

  vim.cmd('terminal ' .. current_buf_wd .. '/run.sh')
end)
