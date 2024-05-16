return {
	"nvimtools/none-ls.nvim",
	config = function()
		local null_ls = require("null-ls")
		local builtins = null_ls.builtins
		null_ls.setup({
			sources = {
				builtins.formatting.stylua,
				builtins.formatting.prettier,
				builtins.formatting.black,
				builtins.formatting.isort,
        builtins.formatting.gofumpt,
        builtins.diagnostics.revive,
				null_ls.builtins.diagnostics.eslint_d.with({
				  condition = function(utils)
						local eslint_configuration_file_names = {
							".eslintrc",
							".eslintrc.json",
							".eslintrc.yaml",
							".eslintrc.yml",
							".eslintrc.js",
							".eslintignore",
							".eslintcache",
						}
						return utils.root_has_file(eslint_configuration_file_names)
					end,
				}),
			},
		})
	end,
}
