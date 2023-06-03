return {
  "lukas-reineke/indent-blankline.nvim",
  config = function()
    -- fancy characters
    vim.opt.list = true
    --vim.opt.listchars:append 'space:⋅'
    vim.opt.listchars:append 'eol:↴'

    require('indent_blankline').setup {
      enabled = true,
      colored_indent_levels = true,
      char = '¦', -- ┊┆ ⎸
      show_trailing_blankline_indent = false,
      space_char_blankline = ' ',
      show_current_context = true,
      show_current_context_start = false,
    }
  end,
}
