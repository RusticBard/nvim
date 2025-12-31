-- <Space> as leader
vim.g.mapleader = " "

-- TIP: Disable arrow keys in normal mode
vim.keymap.set("n", "<left>", '<cmd>echo "Use h to move!!"<CR>')
vim.keymap.set("n", "<right>", '<cmd>echo "Use l to move!!"<CR>')
vim.keymap.set("n", "<up>", '<cmd>echo "Use k to move!!"<CR>')
vim.keymap.set("n", "<down>", '<cmd>echo "Use j to move!!"<CR>')

-- Move visual mode selection
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move visual mode selection down" })
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move visual mode selection up" })

-- less movement of cursor
vim.keymap.set("n", "J", "mzJ`z", { desc = "keep cursor on same line during j" })
vim.keymap.set("n", "<c-d>", "<c-d>zz", { desc = "less movement of cursor during <c-d>" })
vim.keymap.set("n", "<c-u>", "<c-u>zz", { desc = "less movement of cursor during <c-u>" })
vim.keymap.set("n", "n", "nzzzv", { desc = "less movement of cursor during n" })
vim.keymap.set("n", "{", "{zz", { desc = "sentence jumps backward with less cursor motion" })
vim.keymap.set("n", "}", "}zz", { desc = "sentence jumps forward with less cursor motion" })
vim.keymap.set("v", "y", "ygv<ESC>", { desc = "Yank and stay where the cursor is at the end" })

-- Preserve text in buffer while overwriting
vim.keymap.set("x", "<leader>p", [["_dP]], { desc = "[P]reserve text in buffer during paste" })

-- Replace all instances of given word
vim.keymap.set("n", "sr", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], { desc = "[S]earch and [R]eplace" })

-- Make the file excutable
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true, desc = "Make e[x]ecutable" })

-- Disable Q
vim.keymap.set("n", "Q", "<nop>", { desc = "Disable Q command" })

-- Clear highlights
vim.keymap.set({ "n" }, "<Esc><Esc>", "<CMD>nohlsearch<CR>", { desc = "Remove highlights" })

-- Commandline mode movement
vim.keymap.set("c", "<C-F>", "<Right>", { desc = "move [F]orward" })
vim.keymap.set("c", "<C-B>", "<Left>", { desc = "move [B]ackward" })

-- Window navigation
vim.keymap.set("n", "<A-h>", "<C-w>h")
vim.keymap.set("n", "<A-j>", "<C-w>j")
vim.keymap.set("n", "<A-k>", "<C-w>k")
vim.keymap.set("n", "<A-l>", "<C-w>l")

-- Buffer navigation
vim.keymap.set("n", "<S-TAB>", "<cmd>bprevious<CR>", { desc = "[b]uffer [p]revious" })
vim.keymap.set("n", "<TAB>", "<cmd>bnext<CR>", { desc = "[b]uffer [n]ext" })
vim.keymap.set("n", "<leader>bd", "<cmd>bdelete<CR>", { desc = "[b]uffer [d]elete" })

-- Yank from default register (") to System Clipboard (+)
vim.keymap.set("n", "<leader>yc", function()
	vim.fn.setreg("+", vim.fn.getreg('"'))
	print("Copied to clipboard")
end, { desc = "[y]ank to [c]lipboard" })

-- Copy from System Clipboard (+) to default register (")
vim.keymap.set("n", "<leader>cy", function()
	vim.fn.setreg('"', vim.fn.getreg("+"))
	print("Copied to yank")
end, { desc = "[c]lipboard to [y]ank" })

vim.keymap.set("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })

vim.keymap.set("n", "<leader>sl", "<CMD>Lazy<CR>", { desc = "[s]how [l]azy" })
vim.keymap.set("n", "<leader>sm", "<CMD>Mason<CR>", { desc = "[s]how [m]ason" })

-- vim.keymap.set('n', '<leader>rf', function()
--   local current_buf_wd = vim.fn.expand("%:p:h")
--
--   vim.cmd('terminal ' .. current_buf_wd .. '/run.sh')
-- end)

vim.keymap.set("n", "-", "<CMD>Oil --float<CR>", { desc = "Open parent directory" })

-- Normal Mode: Start the selection
vim.keymap.set("n", "<CR>", function()
	vim.treesitter.incremental_selection.init()
end, { desc = "Start Treesitter selection" })

-- Visual Mode: Grow by Node
vim.keymap.set("x", "<CR>", function()
	vim.treesitter.incremental_selection.node_incremental()
end, { desc = "Increment Treesitter selection" })

-- Visual Mode: Grow by Scope (The big jumps)
vim.keymap.set("x", "<C-s>", function()
	vim.treesitter.incremental_selection.scope_incremental()
end, { desc = "Increment Treesitter scope" })

-- Visual Mode: Shrink
vim.keymap.set("x", "<BS>", function()
	vim.treesitter.incremental_selection.node_decremental()
end, { desc = "Decrement Treesitter selection" })
