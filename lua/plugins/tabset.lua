return {
  "FotiadisM/tabset.nvim",
  config = function()
    require("tabset").setup({
      defaults = {
        tabwidth = 4,
        expandtab = true
      },
      languages = {
        {
          filetypes = { "javascript", "typescript", "javascriptreact", "typescriptreact", "json", "yaml", "lua" },
          config = {
            tabwidth = 2
          },
        },
        rust = {
          tabwidth = 4,
          expandtab = true,
        },
        make = {
          tabwidth = 4,
          expandtab = false,
        }
      }
    })
  end,
}
