return {
	"zbirenbaum/copilot.lua",
	cmd = "Copilot",
	event = "InsertEnter",
	config = function()
		require("copilot").setup({
			suggestion = {
				enabled = true,
				auto_trigger = true, -- Crucial for comment-based suggestions
				keymap = {
					accept = "<Tab>",
				},
			},
		})
	end,
}
