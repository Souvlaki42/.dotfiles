return {{
	"nvimtools/none-ls.nvim",
	dependencies = {
		"nvimtools/none-ls-extras.nvim",
	},
	config = function()
		local null_ls = require("null-ls")
		null_ls.setup({
			sources = {
				null_ls.builtins.formatting.stylua,
				null_ls.builtins.formatting.prettierd,
				null_ls.builtins.formatting.gofumpt,
				null_ls.builtins.formatting.black,
				null_ls.builtins.formatting.isort,
				require("none-ls.diagnostics.eslint_d").with({
					condition = function(utils)
						return utils.root_has_file({
							".eslintrc",
							".eslintrc.json",
							".eslintrc.yaml",
							".eslintrc.yml",
							".eslintrc.js",
							".eslintignore",
							".eslintcache",
						})
					end,
				}),
			},
		})
   	end,
}, {
    "jay-babu/mason-null-ls.nvim",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
        "williamboman/mason.nvim",
      "nvimtools/none-ls.nvim",
    },
    config = function()
      require("mason-null-ls").setup({
        ensure_installed = {
          "stylua",
          "prettierd",
          "gofumpt",
          "black",
          "isort",
          "eslint_d",
        },
        automatic_installation = true
       })
    end,
  }}
