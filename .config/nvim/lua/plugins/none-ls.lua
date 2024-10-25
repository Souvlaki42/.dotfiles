return {
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
        null_ls.builtins.diagnostics.revive,
        null_ls.builtins.formatting.black,
        null_ls.builtins.formatting.isort,
        require("none-ls.diagnostics.eslint_d").with({
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
