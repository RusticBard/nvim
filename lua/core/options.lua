vim.opt.cursorline = true
vim.opt.guicursor = ""
vim.opt.mouse = ""
vim.opt.mousescroll = "ver:0,hor:0"
vim.opt.showmode = false
vim.o.conceallevel = 2
vim.opt.cmdheight = 0

vim.opt.shortmess:append("I") -- Suppress intro message
vim.opt.shortmess:append("c") -- Suppress "Press ENTER" messages in certain cases

vim.opt.nu = true
vim.opt.relativenumber = true
-- vim.opt.colorcolumn = '80'

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.smartindent = true
vim.opt.breakindent = true

vim.opt.wrap = false

vim.opt.swapfile = false
vim.opt.undofile = true
vim.opt.backup = false

vim.opt.hlsearch = true
vim.opt.incsearch = true

vim.opt.termguicolors = true

vim.opt.scrolloff = 999
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

vim.opt.updatetime = 250
vim.opt.timeoutlen = 300

vim.opt.list = true
vim.opt.listchars = {
	tab = "│ ", -- This puts the line at the start of the tab
	multispace = " ", -- Keeps multiple spaces from showing dots
	lead = " ", -- Keeps leading spaces from showing dots
	trail = " ", -- Hides trailing space dots (optional)
	nbsp = "␣",
}
vim.opt.inccommand = "split"
vim.opt.laststatus = 3
vim.opt.statusline = " %f %m %= %l:%c ♥ "
vim.opt.splitbelow = true
vim.opt.splitright = true

vim.opt.lazyredraw = true

vim.opt.fillchars = { eob = " " }

vim.g.netrw_banner = 1
vim.g.netrw_liststyle = 3
vim.g.netrw_bufsettings = "nonu nornu noma ro nobl"
vim.g.netrw_browse_split = 0 -- (4 to open in other window)
vim.g.netrw_altfile = 0 -- (4 to open in other window)
vim.g.netrw_list_hide = "^\\.\\.\\?/$,\\(^\\|\\s\\s\\)\\zs\\.\\S\\+"

-- Change this to false or just delete the line
vim.opt.lazyredraw = false
