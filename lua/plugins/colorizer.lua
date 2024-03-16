return {
	"norcalli/nvim-colorizer.lua",
	config = function()
		require("colorizer").setup({
			'*'; -- Highlight all files, but customize some others.
			css = { rgb_fn = true; }; -- Enable parsing rgb(...) functions in css.
			html = { names = false; }; -- Disable parsing "names" like Blue or Gray
			c = { names = false; }; -- Disable parsing "names" like Blue or Gray
			lua = { names = false; }; -- Disable parsing "names" like Blue or Gray
			tex = { names = false; }; -- Disable parsing "names" like blue or Gray
			python = { names = false; }; -- Disable parsing "names" like Blue or Gr>
		})

		vim.keymap.set('n', '<leader>cb', ':ColorizerAttachToBuffer<CR>',
			{silent = false, desc = 'Reload Colorizer'})
	end
}

