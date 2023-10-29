return {
  "nvim-neorg/neorg",

  build = ":Neorg sync-parsers",
  dependencies = { "nvim-lua/plenary.nvim" },
  config = function()
    require("neorg").setup {
      load = {
        ["core.defaults"] = {}, -- Loads default behaviour
        ["core.concealer"] = {
          config = {
            icon_preset = "diamond",
            folds = false,
          }
        },                  -- Adds pretty icons to your documents
        ["core.dirman"] = { -- Manages Neorg workspaces
          config = {
            workspaces = {
              Notes = "~/Documents/Notes",
              Sociology = "~/Documents/Notes/Sociology",
            },
            default_workspace = "Notes"
          },
        },
      },
    }
  end,
}
