return {
	"mfussenegger/nvim-lint",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local lint = require("lint")

		-- -- customize eslint to workspace specific settings :(
		-- local eslint_args = lint.linters.eslint_d.args
		-- table.insert(eslint_args, 1, "--config")
		-- table.insert(eslint_args, 2, ".eslintrc-incremental.js")

		lint.linters_by_ft = {
			html = { "eslint_d", "stylelint" },
			javascript = { "eslint_d", "stylelint" },
			typescript = { "eslint_d", "stylelint" },
			javascriptreact = { "eslint_d", "stylelint" },
			typescriptreact = { "eslint_d", "stylelint" },
			svelte = { "eslint_d", "stylelint" },
			css = { "stylelint" },
			less = { "stylelint" },
			sass = { "stylelint" },
			scss = { "stylelint" },
			python = { "pylint" },
			-- markdown = { "stylelint" },
			bash = { "shellcheck" },
			zsh = { "shellcheck" },
			gitcommit = { "gitlint" },
		}

		local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })

		vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
			group = lint_augroup,
			callback = function()
				lint.try_lint()
			end,
		})

		vim.keymap.set("n", "<leader>l", function()
			lint.try_lint()
		end, { desc = "Trigger linting for current file" })
	end,
}
