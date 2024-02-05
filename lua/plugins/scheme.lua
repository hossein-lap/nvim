function ColorThem(sel_color)
	local alpha = 1
	local color = sel_color or 'sunbather'

	vim.cmd.colorscheme(color)

	if alpha ~= 0 then
		local sections = {
			'Normal',
			'NormalFloat',
			'SignColumn',
			'WhichKeyFloat',
			'VertSplit',
			'TabLineSel',
			'FoldColumn',
			-- 'Folded',
			-- 'EndOfBuffer',
			-- 'LineNr',
			'CursorLineNr',
		}

		for i = 1, #sections do
			vim.api.nvim_set_hl(0, sections[i], {bg = 'none'})
		end

		-- colorscheme
		vim.api.nvim_set_hl(0, "StatusLine", {bg = '#121212', fg = '#ccccce'})
		vim.api.nvim_set_hl(0, "StatusLineNC", {bg = '#ccccce', fg = '#121212'})
	end
end

return {

	{
		'Shatur/neovim-ayu',
		config = function()
			ColorThem("ayu-dark")
		end
	},

	{
		'hossein-lap/vim-hybrid',
		-- config = function ()
		-- 	ColorThem("hybrid")
		-- end
	},

	{
		"Mofiqul/dracula.nvim",
		-- config = function()
		-- 	ColorThem("dracula.nvim")
		-- end
	},

	{
		"tiagovla/tokyodark.nvim",
		-- config = function()
		-- 	ColorThem("tokyodark.nvim")
		-- end
	},

	{
		"ishan9299/nvim-solarized-lua",
		-- config = function()
		-- 	ColorThem("nvim-solarized-lua")
		-- end
	},

	{
		"ellisonleao/gruvbox.nvim",
		-- config = function()
		-- 	ColorThem("gruvbox.nvim")
		-- end
	},

	{
		"hossein-lap/vim-256noir",
		-- config = function()
		-- 	ColorThem("vim-256noir")
		-- end
	},

	{
		"hossein-lap/vim-sunbather",
		-- config = function()
		-- 	ColorThem("vim-sunbather")
		-- end
	},

	{
		"hossein-lap/vim-paramount",
		-- config = function()
		-- 	ColorThem("vim-paramount")
		-- end
	},

	{
		"hossein-lap/vim-lupper",
		-- config = function()
		-- 	ColorThem("vim-lupper")
		-- end
	},

	{
		"hossein-lap/vim-octave",
		-- config = function()
		-- 	ColorThem("vim-octave")
		-- end
	},

}
