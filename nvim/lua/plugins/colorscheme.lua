return {
	-- folke colorscheme configuration
	{
		"0xstepit/flow.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			require("flow").setup({
				theme = {
					style = "dark",
					contrast = "default",
					transparent = true,
				},
				colors = {
					mode = "default",
					fluo = "pink",
					-- custom = {
					-- 	saturation = "70",
					-- 	light = "60",
					-- },
				},
				ui = {
					borders = "inverse", -- theme | inverse | fluo | none
					aggressive_spell = true,
					aggressive_special_comment = true,
				},
				-- TODO: remove legacy config below
				-- dark_theme = true,
				-- transparent = true, -- Set transparent background.
				-- high_contrast = false, -- Make the dark background darker or light background lighter.
				-- fluo_color = "pink", --  Color used as fluo: pink, yellow, orange or green.
				-- mode = "base", -- Intensity of the palette: dark, bright, desaturate or base.
				-- aggressive_spell = false, -- Use colors for spell check.
			})

			vim.opt.fillchars = "eob:⋅" -- my mod: do not display tildas at the end of the buffer
			vim.cmd("colorscheme flow")

			-- "fix" visual settings for todo-comments
			local todoHlGroups = {
				"TodoFgTODO",
				"TodoFgWARN",
				"TodoFgFIX",
				"TodoFgNOTE",
			}
			for _, hlGroupName in ipairs(todoHlGroups) do
				local hlDefinition = vim.api.nvim_get_hl(0, { name = hlGroupName })
				hlDefinition.bold = true
				vim.api.nvim_set_hl(0, hlGroupName, hlDefinition)
			end
		end,
	},
}
