-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.highlight.on_yank()`
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

local function get_theme_color(group, attr)
    local hl = vim.api.nvim_get_hl(0, { name = group, link = false })
    local color = hl[attr]
    return color and string.format("#%06x", color) or nil
end

local statusline_group = vim.api.nvim_create_augroup('ModeStatusLine', { clear = true })

local function update_hl()
    local mode_colors = {
        n = get_theme_color('Function', 'fg') or '#81a1c1',
        i = get_theme_color('String', 'fg')   or '#a3be8c',
        v = get_theme_color('Statement', 'fg') or '#b48ead',
        V = get_theme_color('Statement', 'fg') or '#b48ead',
        ['\22'] = get_theme_color('Statement', 'fg') or '#b48ead',
        R = get_theme_color('ErrorMsg', 'fg') or '#bf616a',
    }

    local mode = vim.fn.mode()
    -- Only update if the mode is in our list; otherwise, default to Normal (blue)
    local color = mode_colors[mode] or mode_colors['n']
    local normal_bg = get_theme_color('Normal', 'bg') or '#1e1e1e'

    vim.api.nvim_set_hl(0, 'StatusLine', { bg = color, fg = normal_bg, bold = true })
end

-- Events that reliably trigger mode-based UI changes
vim.api.nvim_create_autocmd({ 'VimEnter', 'ModeChanged', 'ColorScheme' }, {
    group = statusline_group,
    callback = update_hl,
})
