return {
	"norcalli/nvim-colorizer.lua",
	config = function()
		require("colorizer").setup({})
		vim.keymap.set('n', '<leader>cb', ':ColorizerAttachToBuffer<CR>',
			{silent = false, desc = 'Reload Colorizer'})
	end
}

