return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"MunifTanjim/nui.nvim",
		"nvim-tree/nvim-web-devicons", -- optional, but recommended
	},
	lazy = false, -- neo-tree will lazily load itself
	---@module 'neo-tree'
	---@type neotree.Config
	opts = {
		close_if_last_window = true,
		enable_git_status = true,
		enable_diagnostics = true,
		sort_case_insensitive = true,
		name = {
			use_git_status_colors = true,
		},

		git_status = {
			symbols = {
				-- Change type
				added = "✚", -- or "✚"
				modified = "", -- or ""
				deleted = "✖", -- this can only be used in the git_status source
				renamed = "󰁕", -- this can only be used in the git_status source
				-- Status type
				untracked = "",
				ignored = "",
				unstaged = "󰄱",
				staged = "",
				conflict = "",
			},
		},

		filesystem = {
			filtered_items = {
				visible = true,
				hide_dotfiles = false,
				hide_gitignored = false,
				hide_ignored = false,
			},
		},

		mappings = {
			["l"] = "open",
		},
	},
}
