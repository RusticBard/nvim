return {
    "mason-org/mason.nvim",

    config = function()
        require("mason").setup({
            ui = {
                border = "rounded",
                width = 0.9,
                height = 0.8,
            }
        })
    end,
}
