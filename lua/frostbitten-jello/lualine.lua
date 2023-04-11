-- Bubbles config for lualine
-- Author: lokesh-krishna
-- MIT license, see LICENSE for more details.

-- stylua: ignore
local colors = {
  blue   = '#80a0ff',
  cyan   = '#79dac8',
  black  = '#1E1E1E', --'#080808',
  white  = '#c6c6c6',
  red    = '#ff5189',
  violet = '#d183e8',
  grey   = '#303030',
}

local bubbles_theme = {
  normal = {
    a = { fg = colors.black, bg = colors.violet },
    b = { fg = colors.white, bg = colors.grey },
    c = { fg = colors.black, bg = colors.black },
  },

  insert = { a = { fg = colors.black, bg = colors.blue } },
  visual = { a = { fg = colors.black, bg = colors.cyan } },
  replace = { a = { fg = colors.black, bg = colors.red } },

  inactive = {
    a = { fg = colors.white, bg = colors.black },
    b = { fg = colors.white, bg = colors.black },
    c = { fg = colors.black, bg = colors.black },
  },
}

require('lualine').setup {
  options = {
    theme = 'auto', --bubbles_theme,
    component_separators = '|',
    section_separators = { left = '', right = '' },
  },
  sections = {
    lualine_a = {
      { 'mode', separator = { left = '' }, right_padding = 2 },
    },
    lualine_b = { 'filename', 'branch' },
    lualine_c = {},
    lualine_x = {},
    lualine_y = { 'filetype', 'progress' },
    lualine_z = {
      { 'location', separator = { right = '' }, left_padding = 2 },
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

-- require('lualine').setup {
--     options = {
--         icons_enabled = false,
--         theme = 'auto',
--         component_separators = { left = '│', right = '│'},
--         section_separators = { left = '', right = ''},
--         disabled_filetypes = {
--             statusline = {},
--             winbar = {},
--         },
--         ignore_focus = {},
--         always_divide_middle = true,
--         globalstatus = true,
--         refresh = {
--             statusline = 1000,
--             tabline = 1000,
--             winbar = 1000,
--         }
--     },
--     sections = {
--         lualine_a = {'mode'},
--         lualine_b = {'branch', 'diff', 'diagnostics', 'filename'},
--         lualine_c = {},
--         lualine_x = {},
--         lualine_y = {'encoding', 'fileformat', 'filetype', 'progress'},
--         lualine_z = {'location'}
--     },
--     inactive_sections = {
--         lualine_a = {},
--         lualine_b = {},
--         lualine_c = {'filename'},
--         lualine_x = {'location'},
--         lualine_y = {},
--         lualine_z = {}
--     },
--     tabline = {},
--     winbar = {},
--     inactive_winbar = {},
--     extensions = {}
-- }
