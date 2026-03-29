return {
	"goolord/alpha-nvim",
	-- dependencies = { 'nvim-mini/mini.icons' },
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		local alpha = require("alpha")
		local dashboard = require("alpha.themes.dashboard")
		dashboard.section.header.val = {

			".==============================================.",
			"|                                              |",
			"|                           .'\\                |",
			"|                          //  ;               |",
			"|                         /'   |               |",
			"|        .----..._    _../ |   \\               |",
			"|         \\'---._ `.-'      `  .'              |",
			"|          `.    '              `.             |",
			"|            :            _,.    '.            |",
			"|            |     ,_    (() '    |            |",
			"|            ;   .'(().  '      _/__..-        |",
			"|            \\ _ '       __  _.-'--._          |",
			"|            ,'.'...____'::-'  \\     `'        |",
			"|           / |   /         .---.              |",
			"|     .-.  '  '  / ,---.   (     )             |",
			"|    / /       ,' (     )---`-`-`-.._          |",
			"|   : '       /  '-`-`-`..........--'\\         |",
			"|   ' :      /  /                     '.       |",
			"|   :  \\    |  .'         o             \\      |",
			"|    \\  '  .' /          o       .       '     |",
			"|     \\  `.|  :      ,    : _o--'.\\      |     |",
			"|      `. /  '       ))    (   )  \\>     |     |",
			"|        ;   |      ((      \\ /    \\___  |     |",
			"|        ;   |      _))      `'.-'. ,-'` '     |",
			"|        |    `.   ((`            |/    /      |",
			"|        \\     ).  .))            '    .       |",
			"|     ----`-'-'  `''.::.________:::mx'' ---    |",
			"|                                              |",
			"|                                              |",
			"|                                              |",
			"'=============================================='",
		}

		dashboard.section.buttons.val = {
			dashboard.button("e", "  New File", ":ene <BAR> startinset <CR>"),
			dashboard.button("SPC f f", "  Find File"),
			dashboard.button("SPC f r", "  Recent Files"),
			dashboard.button("SPC f g", "󰣉  Find Word"),
			dashboard.button("SPC s l", "  Open Last Session"),
			dashboard.button("SPC s r", "  Find Recent Session"),
		}

		local handle = io.popen("fortune")
		local fortune = handle:read("*a")
		handle:close()
		dashboard.section.footer.val = fortune

		alpha.setup(dashboard.config)
	end,
}
