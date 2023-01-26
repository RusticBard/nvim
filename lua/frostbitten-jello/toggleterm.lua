require("toggleterm").setup{
    shade_filetypes = { "none", "fzf" },
    -- persist_size = true,
	open_mapping = [[<c-\>]],
    size = 10,
    direction = 'float', -- 'vertical' | 'horizontal' | 'tab' | 'float'
    auto_scroll = true,
    shell = vim.o.shell, -- change the default shell
    close_on_exit = true, -- close the terminal window when the process exits
    autochdir = true,
    float_opts = {
        -- The border key is *almost* the same as 'nvim_open_win'
        -- see :h nvim_open_win for details on borders however
        -- the 'curved' border is a custom border type
        -- not natively supported but implemented in this plugin.
        border = 'curved',  --'single' | 'double' | 'shadow' | 'curved' | ... other options supported by win open
        -- like `size`, width and height can be a number or function which is passed the current terminal
    },
    winblend = 3,
}

