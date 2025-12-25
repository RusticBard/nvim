local M = {}

M.setup = function()
    -- 1. Load the core theme
    vim.cmd("colorscheme carbonfox")

    -- 2. Define standard highlights (using Lua API for better performance)
    local groups = {
        -- The vertical separator you liked
        WinSeparator = { fg = "#525252", bg = "none" },
        
        -- Transparency Overrides
        Normal       = { bg = "none" },
        NormalNC     = { bg = "none" },
        NormalFloat  = { bg = "none" },
        FloatBorder  = { bg = "none" },
        Pmenu        = { bg = "none" },
        SignColumn   = { bg = "none" },
        StatusLine   = { bg = "none" },
        StatusLineNC = { bg = "none" },
    }

    for group, opts in pairs(groups) do
        vim.api.nvim_set_hl(0, group, opts)
    end

    -- 3. Link Lualine and Message Area components
    -- These ensure your command area matches your statusline style
    local links = {
        ['MsgArea'] = 'lualine_c_normal',
        ['lualine_c_normal'] = 'CursorLine',
        ['lualine_c_insert'] = 'CursorLine',
        ['lualine_c_visual'] = 'CursorLine',
        ['lualine_c_command'] = 'CursorLine',
        ['lualine_c_terminal'] = 'CursorLine',
        ['lualine_c_replace'] = 'CursorLine',
        ['lualine_c_inactive'] = 'CursorLine',
        ['lualine_c_buffers_inactive'] = 'CursorLine',
        ['lualine_c_buffers_active_normal'] = 'lualine_a_insert',
    }

    for from, to in pairs(links) do
        vim.api.nvim_command(string.format('highlight! default link %s %s', from, to))
    end
end

return M
