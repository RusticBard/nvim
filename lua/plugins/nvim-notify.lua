return {
	"rcarriga/nvim-notify",
	opts = {
		-- Animation style: "fade", "slide", "fade_in_slide_out", or "static"
		stages = "static",
		-- Framerate: Default is 30. Higher (60) is smoother but uses more CPU.
		fps = 120,
		-- How long the message stays on screen (in milliseconds)
		timeout = 3000,
		-- Where the cards appear
		top_down = true,
	},
}
