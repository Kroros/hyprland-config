return {
	"rmagatti/auto-session",
	lazy = false,
	keys = {
		{ "<leader>sr", "<cmd>AutoSession search<CR>", desc = "Find Recent Session" },
		{ "<leader>sl", "<cmd>AutoSession restore<CR>", desc = "Open Last Session" },
	},
	---enables autocomplete for opts
	---@module "auto-session"
	---@type AutoSession.Config
	opts = {
		suppressed_dirs = { "~/", "~/Projects", "~/Downloads", "/" },
		-- log_level = 'debug',
		auto_restore = false,
	},
}
