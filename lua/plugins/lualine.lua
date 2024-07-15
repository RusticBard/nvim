return {
  'nvim-lualine/lualine.nvim',
  dependencies = {
    'nvim-tree/nvim-web-devicons', opt = true
  },
  config = function()
    require('lualine').setup {
      options = {
        icons_enabled = true,
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
        lualine_b = {
          'branch',
        },
        lualine_c = { {
          'filename',
        }
        },
        lualine_x = { {
          'buffers',
          hide_filename_extension = true,
          show_modified_status = false,
          show_filename_only = true,
          mode = 1,

        }
        },
        lualine_y = { 'filetype' },
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
