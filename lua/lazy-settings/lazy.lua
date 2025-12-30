return {

	spec = {
		-- import your plugins
		{ import = "plugins" },
		{ import = "colorschemes" },
	},
	-- Configure any other settings here. See the documentation for more details.
	-- colorscheme that will be used when installing plugins.
	-- install = { colorscheme = { "habamax" } },
	-- automatically check for plugin updates
	checker = { enabled = true },

	transparent = true,
	styles = {
		sidebars = "transparent",
		floats = "transparent",
	},

	ui = {
		-- -- a number <1 is a percentage., >1 is a fixed size
		size = { width = 0.9, height = 0.8 },
		-- wrap = true, -- wrap the lines in the ui
		-- -- The border to use for the UI window. Accepts same border values as |nvim_open_win()|.
		border = "rounded",
		-- -- The backdrop opacity. 0 is fully opaque, 100 is fully transparent.
		backdrop = 100,
		-- title = nil, ---@type string only works when border is not "none"
		-- title_pos = "center", ---@type "center" | "left" | "right"
		-- -- Show pills on top of the Lazy window
		-- pills = true, ---@type boolean
	},
}
