return {
 "rcarriga/nvim-notify",
  config = function()
    local notify = require("notify")
    
    notify.setup({
      stages = "static", -- Options: "fade", "slide", "fade_in_slide_out", "static"
      timeout = 3000,  -- 3 seconds
      background_colour = "#000000", -- Important for transparency!
      render = "compact", -- "default", "minimal", "simple", "compact"
      top_down = false,  -- Bottom right
     fps = 120, 
    })

    -- This makes nvim-notify the default handler for vim.notify
    vim.notify = notify
  end,
} 
