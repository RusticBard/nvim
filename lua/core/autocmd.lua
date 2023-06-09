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

-- Change color of the cmdline
-- vim.api.nvim_create_autocmd({'ColorScheme'}, {
--   pattern = '*',
--   callback = function()
--     vim.cmd('highlight MsgArea guibg=#1c1c1c gui=bold guisp=NONE')
--   end,
-- })
