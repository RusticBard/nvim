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

-- Hide lualine when in command mode
vim.api.nvim_create_autocmd('CmdlineEnter', {
  pattern = '*',
  callback = function()
    require('lualine').hide({})
  end,
})

-- Show lualine when command mode is exit
vim.api.nvim_create_autocmd('CmdlineLeave', {
  pattern = '*',
  callback = function()
    require('lualine').hide({ unhide = true })
  end,
})

vim.api.nvim_create_autocmd("User", {
    pattern = "AlphaReady",
    command = "set laststatus=0"
})

vim.api.nvim_create_autocmd("User", {
    pattern = "AlphaClosed",
    command = "set laststatus=2",
})
