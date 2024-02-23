return {
	{
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup()
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		lazy = false,
		opts = {
			auto_install = true,
		},
	},
	{
		"neovim/nvim-lspconfig",
		config = function()
			local capabilities = require("cmp_nvim_lsp").default_capabilities()
			local lspconfig = require("lspconfig")

			local servers = {
				{
					name = "lua_ls",
					setup = {
						capabilities = capabilities,
						settings = {
							Lua = {
								diagnostics = {
									globals = { "vim" },
								},
							},
						},
					},
				},
				{
					name = "tsserver",
				},
				{
					name = "pyright",
				},
				{
					name = "gopls",
				},
				{
					name = "rust_analyzer",
					setup = {
						root_dir = lspconfig.util.root_pattern("package.json"),
						single_file_support = false,
					},
				},
			}

			for _, server in ipairs(servers) do
				server.setup = server.setup or {}
				server.setup.capabilities = server.setup.capabilities or capabilities
				lspconfig[server.name].setup(server.setup)
			end

			vim.api.nvim_create_autocmd("LspAttach", {
				group = vim.api.nvim_create_augroup("UserLspConfig", {}),
				callback = function(ev)
					local opts = { buffer = ev.buf }
					vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
					vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
					vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
					vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
					vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, opts)
					vim.keymap.set("n", "<leader>wa", vim.lsp.buf.add_workspace_folder, opts)
					vim.keymap.set("n", "<leader>wr", vim.lsp.buf.remove_workspace_folder, opts)
					vim.keymap.set("n", "<leader>wl", function()
						print(vim.inspect(vim.lsp.buf.list_workleader_folders()))
					end, opts)
					vim.keymap.set("n", "<leader>D", vim.lsp.buf.type_definition, opts)
					vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
					vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts)
					vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
					vim.keymap.set("n", "<leader>fo", function()
						vim.lsp.buf.format({ async = true })
					end, opts)
				end,
			})
		end,
	},
}
