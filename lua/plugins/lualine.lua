return {
  'nvim-lualine/lualine.nvim',
  dependencies = {
    'nvim-tree/nvim-web-devicons', opt = true
  },
  config = function()
    require('lualine').setup {
      options = {
        icons_enabled = false,
        theme = 'auto',
        component_separators = '',
        section_separators = { left = '', right = '' }, --
      },
      sections = {
        lualine_a = {
          {
            'mode',
            separator = { left = '' },
            right_padding = 1,
          },
        },
        lualine_b = { 'filename' },
        lualine_c = { 'branch' },
        lualine_x = { 'filetype' },
        lualine_y = { 'progress' },
        lualine_z = {
          { 'location', separator = { right = '' }, left_padding = 2 },
        },
      },
      inactive_sections = {
        lualine_a = { 'filename' },
        lualine_b = {},
        lualine_c = {},
        lualine_x = {},
        lualine_y = {},
        lualine_z = { 'location' },
      },
      tabline = {},
      extensions = {},
    }
  end
}
