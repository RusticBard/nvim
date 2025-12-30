-- ~/.config/nvim/lua/lsp/init.lua

local M = {}

-- Define which servers you want to use here
-- The values are the configuration tables (loaded from separate files)
M.servers = {
	lua_ls = require("lsp.lua_ls"),
	-- ts_ls = require('lsp.ts_ls'),
	-- pyright = require('lsp.pyright'),
}

return M
