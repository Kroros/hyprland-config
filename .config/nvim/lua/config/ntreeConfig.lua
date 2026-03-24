vim.keymap.set("n", "<leader>e", "<Cmd>Neotree toggle<CR>")

require("neo-tree").setup({
	enable_git_status = true,
	enable_diagnostics = true,
	sort_case_insensitive = true,
	name = {
		use_git_status_colors = true,
	},
	git_status = {
		symbols = {
			-- Change type
			added = "", -- or "✚"
			modified = "", -- or ""
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
	mappings = {
		["l"] = "open_tabnew",
		["<CR>"] = "open_tabnew",
		["S"] = "open_split",
		["s"] = "open_vsplit",
		["a"] = {
			"add",
			config = {
				show_path = "none",
			},
		},
		["A"] = "add_directory",
		["d"] = "delete",
		["r"] = "rename",
	},
	filesystem = {
		hide_dotfile = false,
		hide_gitingored = false,
		hide_ignored = false,
	},
})
