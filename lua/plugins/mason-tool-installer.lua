return {
	"WhoIsSethDaniel/mason-tool-installer.nvim",

	config = function()
		local servers = require("lsp").servers

		local ensure_installed = vim.tbl_keys(servers or {})
		vim.list_extend(ensure_installed, {
			"stylua", -- Used to format Lua code
		})
		require("mason-tool-installer").setup({ ensure_installed = ensure_installed })
	end,
}
