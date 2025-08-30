return {
	"williamboman/mason.nvim",
	dependencies = {
		"williamboman/mason-lspconfig.nvim",
		"WhoIsSethDaniel/mason-tool-installer.nvim",
	},
	config = function()
		-- import mason
		local mason = require("mason")
		-- import mason-lspconfig
		local mason_lspconfig = require("mason-lspconfig")
		local mason_tool_installer = require("mason-tool-installer")

		-- enable mason and configure icons
		mason.setup({
			-- uncoment line below if you run into troubles installing anything
			-- log_level = vim.log.levels.DEBUG,
			ui = {
				border = "rounded",
				icons = {
					package_installed = "✓",
					package_pending = "➜",
					package_uninstalled = "✗",
				},
			},
		})

		mason_lspconfig.setup({
			-- list of servers for mason to install
			ensure_installed = {
				"lua_ls",
				"gopls",
				"ts_ls",
				"pyright",
				"graphql",
			},
		})

		mason_tool_installer.setup({
			ensure_installed = {
				-- formatters
				"prettier",
				"stylua",
				"isort", -- for python
				"black", -- for python

				-- linters
				{ "pylint", version = "3.2.7" }, -- bind specific version because it's the last one supporting Python 3.8
				"eslint_d",
				"stylelint",
				"shellcheck",
				"gitlint",
			},
		})
	end,
}
