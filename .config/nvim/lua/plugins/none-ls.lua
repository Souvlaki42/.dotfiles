return {
  "nvimtools/none-ls.nvim",
  config = function()
    local null_ls = require("null-ls")
    null_ls.setup({
      sources = {
        null_ls.builtins.formatting.stylua,
        null_ls.builtins.formatting.prettier,
        null_ls.builtins.formatting.black,
        null_ls.builtins.formatting.isort,
        null_ls.builtins.diagnostics.eslint_d.with({
          condition = function (params)
            local project_root = vim.fn.finddir(".eslintrc*", params.root)
            return project_root ~= nil
          end,
        }),
        null_ls.builtins.diagnostics.revive,
        null_ls.builtins.formatting.gofumpt,
      },
    })

    vim.keymap.set("n", "<A-f>", vim.lsp.buf.format, {})
  end,
}
