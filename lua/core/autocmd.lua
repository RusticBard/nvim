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

vim.api.nvim_create_autocmd('bufWrite', {
  pattern = '*',
  callback = function()
    vim.lsp.buf.format()
  end,
})

-- Function to check if the cursorline is centered and apply zz if necessary
local function ensure_centered()
  -- Get the current window and cursor position
  local window_height = vim.api.nvim_win_get_height(0)
  local cursor_row = vim.fn.line(".")
  local end_row = vim.fn.line("$")

  local half_window_height = math.floor(window_height / 2)

  if math.abs(end_row - cursor_row) < half_window_height then
    -- Perform zz if not centered and cursor is near the end
    vim.cmd("normal! zz")
  end
end

-- Create the autocommand
vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
  pattern = "*",
  callback = ensure_centered,
})
