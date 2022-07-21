cmd 'packadd packer.nvim'

return require('packer').startup(function()
	use 'wbthomason/packer.nvim' -- Plugin manager
	use 'neovim/nvim-lspconfig' -- Configurations for Nvim LSP
	use 'hrsh7th/nvim-cmp' -- Autocompletion plugin
	use 'hrsh7th/cmp-nvim-lsp' -- LSP source for nvim-cmp
	use 'saadparwaiz1/cmp_luasnip' -- Snippets source for nvim-cmp
	use 'L3MON4D3/LuaSnip' -- Snippets plugin
	use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' } -- Treesitter
	use 'norcalli/nvim-colorizer.lua' -- Hex color preview
	use 'NvChad/nvterm' -- terminal plugin
	--use "EdenEast/nightfox.nvim" -- colorscheme nightfox
	--use 'folke/tokyonight.nvim' -- colorscheme
	use 'tiagovla/tokyodark.nvim' -- colorscheme
	--use 'navarasu/onedark.nvim' -- onedark colorscheme
	use 'nvim-lualine/lualine.nvim' -- status line
	use 'kyazdani42/nvim-web-devicons' -- icons
    use { 'kyazdani42/nvim-tree.lua', tag = 'nightly' }
end)
