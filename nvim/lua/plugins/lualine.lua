return {
	"nvim-lualine/lualine.nvim",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
		"AndreM222/copilot-lualine",
	},
	config = function()
		local lualine = require("lualine")
		local lazy_status = require("lazy.status")

		lualine.setup({
			extensions = { "nvim-tree" },
			options = {
				-- theme = "flow",
				component_separators = "│",
				section_separators = "",
			},
			sections = {
				lualine_a = {
					{
						"mode",
						fmt = function(str)
							return str:sub(1, 1)
						end,
					},
				},
				lualine_b = {
					{
						"branch",
						fmt = function(str)
							local total_width = vim.api.nvim_win_get_width(0)
							local max_length = math.ceil(total_width * 0.2)
							-- local branch_name = str:gsub("^marekg%-at%-s/", "/")
							local branch_name = str:gsub("^marekg%-at%-s/", "…")
							if #branch_name > max_length then
								return branch_name:sub(1, max_length) .. "…"
							else
								return branch_name
							end
						end,
					},
					-- { "diff", colored = true, symbols = { added = " ", modified = "柳", removed = " " } },
				},
				lualine_c = {
					{
						"filename",
						path = 1,
					},
				},
				lualine_x = {
					{
						lazy_status.updates,
						cond = lazy_status.has_updates,
						color = { fg = "#ff007c" },
					},
					{ "lsp_status" },
					{ "copilot" },
					{ "encoding" },
					{ "fileformat" },
					{ "filetype" },
				},
			},
		})
	end,
}
