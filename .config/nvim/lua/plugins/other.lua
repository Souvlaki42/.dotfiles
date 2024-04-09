return {
	{ "rust-lang/rust.vim" },
	{ "christoomey/vim-tmux-navigator" },
	{ "nvim-pack/nvim-spectre" },
	{
		"pmizio/typescript-tools.nvim",
		dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
	},
	{
		"numToStr/Comment.nvim",
		opts = {
			-- add any options here
		},
		lazy = false,
	},
}
