vim.opt.cursorline = true
vim.opt.guicursor = ''
vim.opt.mouse = ''
vim.opt.mousescroll = 'ver:0,hor:0'
vim.opt.showmode = false
vim.o.conceallevel = 2
vim.opt.cmdheight = 0

vim.opt.nu = true
vim.opt.relativenumber = true
-- vim.opt.colorcolumn = '80'

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.smartindent = true

vim.opt.wrap = false

vim.opt.swapfile = false
vim.opt.backup = false

vim.opt.hlsearch = true
vim.opt.incsearch = true

vim.opt.termguicolors = true

vim.opt.scrolloff = 999
vim.opt.signcolumn = 'yes'
vim.opt.isfname:append('@-@')

vim.opt.updatetime = 50
vim.opt.timeoutlen = 50

vim.opt.laststatus = 3
vim.opt.splitbelow = true
vim.opt.splitright = true

vim.opt.lazyredraw = true

-- Open help in a new buffer instead of a vsplit
vim.api.nvim_create_autocmd('BufWinEnter', {
  pattern = '*',
  callback = function(event)
    if vim.bo[event.buf].filetype == 'help' then
      vim.cmd.only()
      vim.bo.buflisted = true
    end
  end,
})

vim.api.nvim_create_autocmd('CmdlineEnter', {
  pattern = '*',
  callback = function()
    require('lualine').hide({})
    vim.cmd('highlight MsgArea guibg=#1c1c1c gui=bold guisp=NONE')
  end,
})

vim.api.nvim_create_autocmd({'CmdlineLeave', 'BufWinEnter'}, {
  pattern = '*',
  callback = function()
    require('lualine').hide({ unhide = true })
    vim.cmd('highlight MsgArea guibg=#1c1c1c gui=bold guisp=NONE')
  end,
})
