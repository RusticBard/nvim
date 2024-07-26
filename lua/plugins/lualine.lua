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
        lualine_b = {
          'branch',
        },
        lualine_c = { {
          'buffers',
          show_filename_only = true,
          hide_filename_extension = true,
          show_modified_status = true,
          mode = '1',

          filetype_names = {
            TelescopePrompt = 'Telescope',
            dashboard = 'Dashboard',
            packer = 'Packer',
            fzf = 'FZF',
            alpha = 'Alpha'
          }, -- Shows specific buffer name for that filetype ( { `filetype` = `buffer_name`, ... } )

          -- Automatically updates active buffer color to match color of other components (will be overidden if buffers_color is set)
          use_mode_colors = true,

          buffers_color = {
            -- Same values as the general color option can be used here.

            -- inactive = 'lualine_{section}_inactive', -- Color for inactive buffer.
          },
          symbols = {
            modified = ' ●', -- Text to show when the buffer is modified
            alternate_file = '#', -- Text to show to identify the alternate file
            directory = '', -- Text to show when the buffer is a directory
          },
        }
        },
        lualine_x = { {

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
