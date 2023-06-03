return {
    'akinsho/bufferline.nvim',
    version = "*",
    dependencies = 'nvim-tree/nvim-web-devicons',

    config = function()
        vim.opt.termguicolors = true
        require("bufferline").setup {
            options = {
                mode = "buffers",
                themable = true,
                offsets = {
                    {
                        filetype = "neo-tree",
                        text = "Files",
                        separator = false,
                    },
                    separator_style = "thick",
                    style_preset = {
                    },
                },
                diagnostics = "nvim_lsp",
            },
        }
        local diagnostics_indicator = function(count, level, diagnostics_dict, context)
            local icon = level:match("error") and " " or " "
            return " " .. icon .. count
        end
    end,
}
