return {
	{
		"windwp/nvim-ts-autotag",
		ft = {
			"javascript",
			"javascriptreact",
			"typescript",
			"typescriptreact",
		},
		setup = function()
			require("nvim-ts-autotag").setup()
		end,
	},
  {
    "windwp/nvim-autopairs",
    opts = {
      fast_wrap = {},
      disable_filetype = {"TelescopePrompt", "vim"}
    },
    config = function(_, opts)
      require("nvim-autopairs").setup(opts)

      local cmp_autopairs = require("nvim-autopairs.completion.cmp")
      require("cmp").event:on("confirm_done", cmp_autopairs.on_confirm_done())
    end
  }
}
