return {
	"nvim-telescope/telescope.nvim",
	-- branch = "0.1.x", -- commenting this out to use the latest version that works better with v0.11
	dependencies = {
		"nvim-lua/plenary.nvim",
		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
		"nvim-tree/nvim-web-devicons",
	},
	config = function()
		local telescope = require("telescope")
		local actions = require("telescope.actions")
		local builtin = require("telescope.builtin")

		telescope.setup({
			defaults = {
				path_display = { "smart" },
				mappings = {
					i = {
						["<C-k>"] = actions.move_selection_previous, -- move to previous result
						["<C-j>"] = actions.move_selection_next, -- move to next result
						["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist, -- send to quick fix list
					},
				},
			},
			pickers = {
				lsp_references = {
					fname_width = 55, -- width of file names in lsp references picker	(default: 30)
					trim_text = true, -- trim text in lsp references picker (default: false)
				},
			},
		})

		telescope.load_extension("fzf")

		-- set kaymaps
		local km = vim.keymap

		km.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>", { desc = "Fuzzy find files in cwd" })
		km.set("n", "<leader>fr", "<cmd>Telescope oldfiles<cr>", { desc = "Fuzzy find recent files" })
		km.set("n", "<leader>fs", "<cmd>Telescope live_grep<cr>", { desc = "Find string in cwd" })
		km.set("n", "<leader>fc", "<cmd>Telescope grep_string<cr>", { desc = "Find string under cursor in cwd" })
		km.set("n", "<leader>ft", "<cmd>TodoTelescope<cr>", { desc = "Find todos" })
		km.set("n", "<leader>fb", "<cmd>Telescope buffers<cr>", { desc = "List buffers" })
		km.set("n", "<leader>fo", builtin.lsp_document_symbols, { desc = "List document symbols" })
	end,
}
