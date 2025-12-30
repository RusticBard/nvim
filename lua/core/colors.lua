vim.cmd("colorscheme carbonfox")

local pmenu_color = vim.api.nvim_get_hl(0, { name = "PmenuSel" }).bg

vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
vim.api.nvim_set_hl(0, "CursorLine", { bg = "#525252" })
vim.api.nvim_set_hl(0, "NormalFloat", { bg = "#181718" })
vim.api.nvim_set_hl(0, "Visual", { link = "PMenuSel" })
vim.api.nvim_set_hl(0, "Whitespace", { fg = pmenu_color, bg = "NONE" })
