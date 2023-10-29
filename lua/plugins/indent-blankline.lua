return {
  "lukas-reineke/indent-blankline.nvim",
  main = 'ibl',
  config = function()
    -- fancy characters
    vim.opt.list = true
    --vim.opt.listchars:append 'space:⋅'
    vim.opt.listchars:append 'eol:↴'
    local highlight = {
      -- "CursorColumn",
      "Whitespace",
    }

    require('ibl').setup {
      enabled = true,
      -- colored_indent_levels = true,
      -- show_trailing_blankline_indent = false,
      -- space_char_blankline = ' ',
      -- show_current_context = true,
      -- show_current_context_start = false,
      indent = {
        highlight = highlight,
        char = "▏"
      },
      scope = {
        enabled = true,
        show_start = false,
        show_end = false,
        injected_languages = true,
        highlight = { "Function", "Label" },
        priority = 500,
      },
    }
  end,
}
