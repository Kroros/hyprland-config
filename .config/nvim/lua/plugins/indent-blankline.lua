return {
	"lukas-reineke/indent-blankline.nvim",
	main = "ibl",
	---@module "ibl"
	---@type ibl.config
	opts = {
		indent = { char = "|" },
		exclude = {
			filetypes = {
				"NvimTree",
				"dashboard",
				"startify",
				"help",
				"packer",
				"neogitstatus",
				"Trouble",
			},
		},
	},
}
