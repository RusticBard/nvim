-- disable netrw at the very start of your init.lua (strongly advised)
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

local HEIGHT_RATIO = 0.8  -- You can change this
local WIDTH_RATIO = 0.5   -- You can change this too

-- OR setup with some options
require("nvim-tree").setup({
    update_focused_file = {
        enable = true,
        update_cwd = true,
    },
    live_filter = {
        prefix = "[FILTER]: ",
        always_show_folders = false, -- Turn into false from true by default
    },
    renderer = {
        root_folder_modifier = ":t",
        icons = {
            glyphs = {
                default = "",
                symlink = "",
                folder = {
                    arrow_open = "",
                    arrow_closed = "",
                    default = "",
                    open = "",
                    empty = "",
                    empty_open = "",
                    symlink = "",
                    symlink_open = "",
                },
                git = {
                    unstaged = "",
                    staged = "S",
                    unmerged = "",
                    renamed = "➜",
                    untracked = "U",
                    deleted = "",
                    ignored = "◌",
                },
            },
        },
    },
    diagnostics = {
        enable = true,
        show_on_dirs = true,
        icons = {
            hint = "",
            info = "",
            warning = "",
            error = "",
        },
    },
    view = {
        -- float = {
        --     enable = true,
        --     open_win_config = function()
        --         local screen_w = vim.opt.columns:get()
        --         local screen_h = vim.opt.lines:get() - vim.opt.cmdheight:get()
        --         local window_w = screen_w * WIDTH_RATIO
        --         local window_h = screen_h * HEIGHT_RATIO
        --         local window_w_int = math.floor(window_w)
        --         local window_h_int = math.floor(window_h)
        --         local center_x = (screen_w - window_w) / 2
        --         local center_y = ((vim.opt.lines:get() - window_h) / 2)
        --         - vim.opt.cmdheight:get()
        --         return {
        --             border = 'rounded',
        --             relative = 'editor',
        --             row = center_y,
        --             col = center_x,
        --             width = window_w_int,
        --             height = window_h_int,
        --         }
        --     end,
        -- },
    },
})

vim.keymap.set('n', '<Leader>fe', '<Cmd>NvimTreeFindFileToggle<CR>')
