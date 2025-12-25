return {
  "folke/noice.nvim",
  event = "VeryLazy",
  dependencies = {
    "MunifTanjim/nui.nvim",
    "rcarriga/nvim-notify",
  },
  opts = {
    -- 1. Disable the popup command line
    cmdline = {
      enabled = true,
      view = "cmdline", -- Use the classic bottom line instead of a popup
      format = {
        cmdline = {
          icon = ">",
        },
      },
    },
    -- 2. Disable the popup search
    messages = {
      enabled = true,
      view = "notify", -- Send all messages (like yanks) to nvim-notify
    },
    popupmenu = {
      enabled = false, -- Keep the classic completion menu
    },
    -- 3. Tell Noice NOT to move your UI
    presets = {
      bottom_search = true,
      command_palette = false,
      long_message_to_split = true,
      inc_rename = false,
    },
  },
}
