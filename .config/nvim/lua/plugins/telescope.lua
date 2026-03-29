return {
	"nvim-telescope/telescope.nvim",
	version = "*",
	dependencies = {
		"nvim-lua/plenary.nvim",
		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
	},
	config = function()
		local builtin = require("telescope.builtin")
		vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Telescope find files" })
		vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Telescope live grep" })
		vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Telescope buffers" })
		vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Telescope help tags" })
		vim.keymap.set("n", "<leader>fr", builtin.oldfiles, { desc = "Telescope find recent file" })
		vim.keymap.set("n", "<leader>fc", builtin.colorscheme, { desc = "Telescope find colour scheme" })
		vim.keymap.set("n", "<leader>fq", builtin.quickfix, { desc = "Telescope list quickfix" })
		vim.keymap.set(
			"n",
			"<leader>fw",
			builtin.current_buffer_fuzzy_find,
			{ desc = "Telescope search inside buffer" }
		)
	end,
}
