return {
	"folke/noice.nvim",
	event = "VeryLazy",
	dependencies = {
		"MunifTanjim/nui.nvim",
		"rcarriga/nvim-notify",
	},
	opts = {
		cmdline = {
			enabled = true,
			view = "cmdline_popup",
			format = {
				cmdline = { pattern = "^:", icon = "", lang = "vim" },
				search_down = { kind = "search", pattern = "^/", icon = " ", lang = "regex" },
				search_up = { kind = "search", pattern = "^%?", icon = " ", lang = "regex" },
				filter = { pattern = "^:%s*!", icon = "$", lang = "bash" },
				lua = { pattern = { "^:%s*lua%s+", "^:%s*lua%s*=%s*", "^:%s*=%s*" }, icon = "", lang = "lua" },
				help = { pattern = "^:%s*he?l?p?%s+", icon = "" },
				input = { view = "cmdline_input", icon = "󰥻 " },
			},
		},
		messages = {
			enabled = true,
			view = "notify",
		},
		lsp = {
			progress = {
				enabled = true,
				view = "notify",
			},
			override = {
				["vim.lsp.util.convert_input_to_markdown_lines"] = false,
				["vim.lsp.util.stylize_markdown"] = false,
				["cmp.entry.get_documentation"] = false,
			},
		},
		views = {
			cmdline_popup = {
				position = { row = 2, col = "50%" },
				size = { width = 60, height = "auto" },
			},
			popupmenu = {
				relative = "editor",
				position = { row = 5, col = "50%" },
				size = { width = 60, height = 10 },
			},
			notify = {
				replace = true,
			},
		},
		routes = {
			{
				filter = {
					event = "lsp",
					kind = "progress",
					find = "Loading workspace",
				},
				opts = { skip = true },
			},
		},
		presets = {
			bottom_search = false,
			command_palette = false,
			long_message_to_split = false,
			inc_rename = false,
			lsp_doc_border = false,
		},
	},
}
