vim.cmd("colorscheme carbonfox")

local pmenu_color = vim.api.nvim_get_hl(0, { name = "PmenuSel" }).bg

vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
vim.api.nvim_set_hl(0, "CursorLine", { bg = "#525252" })
vim.api.nvim_set_hl(0, "NormalFloat", { bg = "#181718" })
vim.api.nvim_set_hl(0, "Visual", { link = "PMenuSel" })
vim.api.nvim_set_hl(0, "Whitespace", { fg = pmenu_color, bg = "NONE" })
vim.api.nvim_set_hl(0, "WinSeparator", { fg = pmenu_color, bg = "NONE" })

-- how to change the background of oil.nvim window to transparent
vim.api.nvim_set_hl(0, "OilNormal", { bg = "none" })
vim.api.nvim_set_hl(0, "OilNormalFloat", { bg = "none" })

-- how to change the background of lazy.vim window to transparent
vim.api.nvim_set_hl(0, "LazyNormal", { bg = "none" })
vim.api.nvim_set_hl(0, "LazyNormalFloat", { bg = "none" })

-- how to change the background of mason.nvim window to transparent
vim.api.nvim_set_hl(0, "MasonNormal", { bg = "none" })
vim.api.nvim_set_hl(0, "MasonNormalFloat", { bg = "none" })

-- how to change the background of which-key.nvim window to transparent
vim.api.nvim_set_hl(0, "WhichKeyFloat", { bg = "none" })
vim.api.nvim_set_hl(0, "WhichKeySeperator", { fg = pmenu_color, bg = "NONE" })
vim.api.nvim_set_hl(0, "WhichKeyDesc", { fg = pmenu_color, bg = "NONE" })

-- how to set NormalFloat to none
vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
