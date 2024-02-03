-- bootstrap {{{
local ensure_packer = function()
	local fn = vim.fn
	local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
	if fn.empty(fn.glob(install_path)) > 0 then
		fn.system({ 'git',
			'clone', '--depth', '1',
			'https://github.com/wbthomason/packer.nvim',
			install_path})
		vim.cmd [[packadd packer.nvim]]
		return true
	end
	return false
end

local packer_bootstrap = ensure_packer()
-- }}}

local util = require('packer.util')
local packer = require('packer')
--local use = packer.use

-- configs {{{
packer.reset()
packer.init {
	ensure_dependencies = true, -- Should packer install plugin dependencies?
	snapshot = nil, -- Name of the snapshot you would like to load at startup
	snapshot_path = util.join_paths(vim.fn.stdpath 'cache', 'packer.nvim'), -- Default save directory for snapshots
	package_root = util.join_paths(vim.fn.stdpath('data'), 'site', 'pack'),
	compile_path = util.join_paths(vim.fn.stdpath('config'), 'plugin', 'packer_compiled.lua'),
	plugin_package = 'packer', -- The default package for plugins
	max_jobs = 1, -- Limit the number of simultaneous jobs. nil means no limit
	auto_clean = true, -- During sync(), remove unused plugins
	compile_on_sync = true, -- During sync(), run packer.compile()
	disable_commands = false, -- Disable creating commands
	opt_default = false, -- Default to using opt (as opposed to start) plugins
	transitive_opt = true, -- Make dependencies of opt plugins also opt by default
	transitive_disable = true, -- Automatically disable dependencies of disabled plugins
	auto_reload_compiled = true, -- Automatically reload the compiled file after creating it.
	preview_updates = true, -- If true, always preview updates before choosing which plugins to update, same as `PackerUpdate --preview`.
	git = {
		cmd = 'git', -- The base command for git operations
		subcommands = { -- Format strings for git subcommands
			update = 'pull --ff-only --progress --rebase=false',
			install = 'clone --depth %i --no-single-branch --progress',
			fetch = 'fetch --depth 999999 --progress',
			checkout = 'checkout %s --',
			update_branch = 'merge --ff-only @{u}',
			current_branch = 'branch --show-current',
			diff = 'log --color=never --pretty=format:FMT --no-show-signature HEAD@{1}...HEAD',
			diff_fmt = '%%h %%s (%%cr)',
			get_rev = 'rev-parse --short HEAD',
			get_msg = 'log --color=never --pretty=format:FMT --no-show-signature HEAD -n 1',
			submodules = 'submodule update --init --recursive --progress'
		},
		depth = 1, -- Git clone depth
		clone_timeout = 6000, -- Timeout, in seconds, for git clones
		default_url_format = 'https://github.com/%s' -- Lua format string used for "aaa/bbb" style plugins
	},
	display = {
		non_interactive = false, -- If true, disable display windows for all operations
		compact = false, -- If true, fold updates results by default
		-- An optional function to open a window for packer's display
		open_fn = nil,
--		open_fn = function()
--			local result, win, buf = util.float {
--				border = {
--					{ '╭', 'Normal' },
--					{ '─', 'Normal' },
--					{ '╮', 'Normal' },
--					{ '│', 'Normal' },
--					{ '╯', 'Normal' },
--					{ '─', 'Normal' },
--					{ '╰', 'Normal' },
--					{ '│', 'Normal' },
--				},
--			}
--			vim.api.nvim_win_set_option(win, 'winhighlight', 'NormalFloat:Normal')
--			return result, win, buf
--		end,
		open_cmd = '65vnew \\[packer\\]', -- An optional command to open a window for packer's display
		working_sym = '⟳', -- The symbol for a plugin being installed/updated
		error_sym = '✗', -- The symbol for a plugin with an error in installation/updating
		done_sym = '✓', -- The symbol for a plugin which has completed installation/updating
		removed_sym = '-', -- The symbol for an unused plugin which was removed
		moved_sym = '→', -- The symbol for a plugin which was moved (e.g. from opt to start)
		header_sym = '━', -- The symbol for the header line in packer's display
		show_all_info = true, -- Should packer show all update details automatically?
		prompt_border = 'double', -- Border style of prompt popups.
		keybindings = { -- Keybindings for the display window
			quit = 'q',
			toggle_update = 'u', -- only in preview
			continue = 'c', -- only in preview
			toggle_info = '<CR>',
			diff = 'd',
			prompt_revert = 'r',
		}
	},
	luarocks = {
		-- Set the python command to use for running hererocks
		python_cmd = 'python'
	},
	-- The default print log level. One of: "trace", "debug",
	-- "info", "warn", "error", "fatal".
	profile = {
		enable = false,
		-- integer in milliseconds, plugins which load faster than this
		-- won't be shown in profile output
		threshold = 1,
	},
	-- Remove disabled or unused plugins without prompting the user
	autoremove = true,
}
-- }}}
-- plugins {{{
return packer.startup(function(use)
	use 'wbthomason/packer.nvim' -- plugin manager
	-- use 'hrsh7th/nvim-gtd' -- go to definition plugin for neovim

	use 'simrat39/symbols-outline.nvim' -- program symbols
	use 'mbbill/undotree' -- undotree
	-- use 'shydefoo/trouble-nvim' -- quickfix and more list

	use 'nvim-treesitter/nvim-treesitter' -- treesitter [more syntax color]
	use 'nvim-treesitter/playground'
	use 'nvim-treesitter/nvim-treesitter-context'

	use 'norcalli/nvim-colorizer.lua' -- hex color preview

	use {'akinsho/bufferline.nvim', tag = "*"} -- bufferline
	use 'nvim-lualine/lualine.nvim' -- statusline
	use 'lewis6991/gitsigns.nvim' -- git signs
	use 'tpope/vim-fugitive' -- git
	-- use 'nvim-tree/nvim-tree.lua' -- tree file-manager

	-- use 'ThePrimeagen/harpoon' -- the harpoon man

--	use 'goolord/alpha-nvim' -- greeting
	use 'folke/which-key.nvim' -- show mapps

	use 'nvim-tree/nvim-web-devicons'
	-- use 'kyazdani42/nvim-web-devicons' -- icons

	-- -- notification manager
	-- use 'rcarriga/nvim-notify'

	use {
		'nvim-telescope/telescope.nvim',
--		tag = '0.1.1',
--		branch = '0.1.x',
		requires = {
			{'nvim-lua/plenary.nvim'},
			-- {"kdheepak/lazygit.nvim"},
		}
	}
	use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }

	-- comment
	use 'numToStr/Comment.nvim'
	-- auto indentation
	-- use 'nmac427/guess-indent.nvim'
	use 'tenxsoydev/tabs-vs-spaces.nvim'


	-- terminal plugin
	use 'akinsho/toggleterm.nvim'

	-- draw ascii diagrams
--	use 'vim-scripts/DrawIt'
	use 'jbyuki/venn.nvim' -- draw ascii diagrams

	-- lsp -- new
	use {
		'VonHeikemen/lsp-zero.nvim',
		branch = 'v2.x',
		requires = {
			-- LSP Support
			{'neovim/nvim-lspconfig'},             -- Required
			{'williamboman/mason.nvim'},           -- Optional
			{'williamboman/mason-lspconfig.nvim'}, -- Optional

			-- Autocompletion
			{'hrsh7th/nvim-cmp'},     -- Required
			{'hrsh7th/cmp-nvim-lsp'}, -- Required
			{'L3MON4D3/LuaSnip'},     -- Required

			-- Extra sources
			{'hrsh7th/cmp-nvim-lua'},  -- nvim Lua API source for nvim-cmp
			{'hrsh7th/cmp-buffer'},    -- buffer source for nvim-cmp
			{'hrsh7th/cmp-path'},      -- path source for nvim-cmp
			{'windwp/nvim-autopairs'}, -- autopair
		}
	}

	-- -- lsp -- old
	-- 	-- LSP Support
	-- 	use 'neovim/nvim-lspconfig' -- Required
	-- 	use 'mfussenegger/nvim-dap' -- debug Adapter Protocol
	--
	-- 	-- Autocompletion
	-- 	use 'hrsh7th/nvim-cmp'      -- Required
	-- 	use 'hrsh7th/cmp-nvim-lua'  -- nvim Lua API source for nvim-cmp
	-- 	use 'hrsh7th/cmp-buffer'    -- buffer source for nvim-cmp
	-- 	use 'hrsh7th/cmp-path'      -- path source for nvim-cmp
	-- 	use 'hrsh7th/cmp-nvim-lsp'  -- Required
	-- 	use 'L3MON4D3/LuaSnip'      -- Required
	-- 	use 'windwp/nvim-autopairs' -- autopair
	--
	-- 	-- lang-specific
	-- 	use 'simrat39/rust-tools.nvim' -- rust
	--
	-- 	-- -- Linting
	-- 	-- use 'jose-elias-alvarez/null-ls.nvim' -- linter and formatter
	-- use 'nvimtools/none-ls.nvim'
	use 'mfussenegger/nvim-lint'
	--
	-- 	-- Third-party tools
	-- 	use 'williamboman/mason.nvim'
	-- 	use 'williamboman/mason-lspconfig.nvim'


	-- colorschemes
	-- use 'hossein-lap/vim-hybrid'
	use 'Shatur/neovim-ayu'
	-- use 'hossein-lap/vim-256noir' -- black-red
	use 'hossein-lap/vim-sunbather' -- black-pink
	use 'hossein-lap/vim-paramount' -- black-purple
	use 'hossein-lap/vim-lupper' -- black-blue
-- 	use 'hossein-lap/vim-octave' -- black-orange
-- 	use(os.getenv("HOME")..'/dev/hossein-lap/vim-colors/vim-octave') -- local
-- 	use os.getenv("HOME")..'/dev/hossein-lap/vim-colors/vim-paramount' -- local
-- 	use os.getenv("HOME")..'/dev/hossein-lap/vim-colors/vim-sunbather' -- local
	use '/home/hos/dev/hossein-lap/vim-colors/vim-256noir' -- local
	use '/home/hos/dev/hossein-lap/vim-colors/vim-hybrid' -- local
	use {os.getenv("HOME")..'/dev/hossein-lap/vim-colors/vim-hos'} -- local
-- 	use os.getenv("HOME")..'/dev/hossein-lap/vim-colors/vim-test' -- local
	use 'Mofiqul/dracula.nvim'
	use 'tiagovla/tokyodark.nvim'
	use 'ishan9299/nvim-solarized-lua'
	use 'ellisonleao/gruvbox.nvim'
-- 	use 'w0ng/vim-hybrid'

-- 	use 'folke/tokyonight.nvim'
	use 'shaunsingh/nord.nvim'
-- 	use { 'catppuccin/nvim', as = 'catppuccin' }
	use 'EdenEast/nightfox.nvim'
	use 'navarasu/onedark.nvim'
	use 'marko-cerovac/material.nvim'
	use {'rose-pine/neovim', as = 'rose-pine'}
	-- use 'dylanaraps/wal.vim'

	-- document
		-- -- markdown
		-- use 'ixru/nvim-markdown'

		-- zen mode: chill (focus)
		use 'Pocco81/true-zen.nvim'
		use 'folke/twilight.nvim'

	-- -- yeah you know it
	-- use 'vimwiki/vimwiki'

	if packer_bootstrap then
		require('packer').sync()
	end
end)
-- }}}
