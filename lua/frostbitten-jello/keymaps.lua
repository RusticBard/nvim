-- <Space> as leader
vim.g.mapleader = " "

-- Move visual mode selection
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Less movement of cursor
vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- Preserve text in buffer while overwriting
vim.keymap.set("x", "<leader>p", [["_dP]])

-- Replace all instances of given word
vim.keymap.set("n", "<leader>sr", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- Make the file excutable
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

-- Disable Q
vim.keymap.set("n", "Q", "<nop>")

-- Diagnostic keymaps
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next)
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float)
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist)

-- CHADtree
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float)

-- Clear highlights
vim.keymap.set('n', '<Esc><Esc>', '<cmd>nohl<CR>')
