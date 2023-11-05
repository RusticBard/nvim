return {
  "willothy/nvim-cokeline",
  lazy = false,

  dependencies = {
    "nvim-lua/plenary.nvim",        -- Required for v0.4.0+
    "kyazdani42/nvim-web-devicons", -- If you want devicons
  },

  config = function()
    local get_hex = require('cokeline.hlgroups').get_hl_attr
    local yellow = vim.g.terminal_color_3

    require('cokeline').setup({ default_hl = {
        fg = function(buffer)
          return
              buffer.is_focused
              and get_hex('Normal', 'fg')
              or get_hex('ColorColumn', 'fg')
        end,
        bg = function(buffer)
          return
            buffer.is_focused
            and get_hex('LineNr', 'fg')
            or get_hex('ColorColumn', 'bg') end,
      },

      sidebar = {
        filetype = { 'NvimTree', 'neo-tree' },
        components = {
          {
            text = function(buf)
              return buf.filetype
            end,
            fg = get_hex('Normal', 'fg'),
            bg = function()
              return get_hex('ColorColumn', 'bg') end,
            bold = true,
          },
        }
      },

      components = {
        {
          text = ' ',
        },
        {
          text = function(buffer)
            return buffer.devicon.icon
          end,
          fg = function(buffer)
            return buffer.devicon.color
          end,
        },
        {
          text = function(buffer) return buffer.filename .. '  ' end,
          bold = function(buffer)
            return buffer.is_focused
          end,
        },
      },
    })
  end
}
