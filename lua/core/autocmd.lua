local my_augroup = vim.api.nvim_create_augroup("UserAutocmds", { clear = true })

-- Openhelp in a new buffer instead of a vsplit
vim.api.nvim_create_autocmd('BufWinEnter', {
  group = my_augroup,
  pattern = '*',
  callback = function(event)
    if vim.bo[event.buf].filetype == 'help' then
      vim.cmd.only()
      vim.bo.buflisted = true
    end
  end,
})

-- Hide/Show lualine in command mode
local status_ok, lualine = pcall(require, "lualine")
if status_ok then
  vim.api.nvim_create_autocmd('CmdlineEnter', {
    group = my_augroup,
    callback = function() lualine.hide({}) end,
  })

  vim.api.nvim_create_autocmd('CmdlineLeave', {
    group = my_augroup,
    callback = function() lualine.hide({ unhide = true }) end,
  })
end

-- Alpha Dashboard UI management
vim.api.nvim_create_autocmd("User", {
  group = my_augroup,
  pattern = "AlphaReady",
  command = "set laststatus=0"
})

vim.api.nvim_create_autocmd("User", {
  group = my_augroup,
  pattern = "AlphaClosed",
  command = "set laststatus=3",   -- Returns to your global statusline
})

-- Auto-format on save (LSP)
vim.api.nvim_create_autocmd('BufWritePre', {
  group = my_augroup,
  pattern = '*',
  callback = function()
    local clients = vim.lsp.get_clients({ bufnr = 0 })
    if #clients > 0 then
      vim.lsp.buf.format({ async = false })
    end
  end,
})

-- Function to check if the cursorline is centered and apply zz if necessary
local function ensure_centered()
  local window_height = vim.api.nvim_win_get_height(0)
  local cursor_row = vim.fn.line(".")
  local end_row = vim.fn.line("$")
  local half_window_height = math.floor(window_height / 2)

  if math.abs(end_row - cursor_row) < half_window_height then
    vim.cmd("normal! zz")
  end
end

-- Center cursor on move
vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
  group = my_augroup,
  pattern = "*",
  callback = ensure_centered,
})
