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
        builtins.diagnostics.eslint_d,
        builtins.diagnostics.revive,
        builtins.formatting.gofumpt,
      },
    })
  end,
}
