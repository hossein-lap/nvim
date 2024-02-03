----*** neovim config ***----

-- set `<localleader> = back-slash` and `<leader> = space` key
vim.g.mapleader = ' '
vim.g.maplocalleader = '\\'

require("main")

-- vim.go.python3_host_prog = '/bin/python3'

-- colorscheme
CurrentColorscheme = 'ayu-dark'

AlphaEnable = 0 -- 0 means no alpha
-- vim.go.fontfaces = 1
TermWindowStyle = 'horizontal'

-- gui {{{

if vim.g.neovide then
	AlphaEnable = 0 -- 0 means no alpha
	vim.o.guifont = "Fira Code:h16"

	-- colorscheme
	-- CurrentColorscheme = 'onedark'
end

-- نمونه شماره یک
-- }}}

-- -- modules {{{
-- require('module.main') -- main options
-- require('module.extra') -- ftype specific extra options
-- require('module.skel') -- to input templates
-- require('module.keybind') -- set the keybindings and shortcuts
-- -- require('module.netrw') -- built-in Tree explorer
-- require('module.rce') -- compile and execute with built-in term
-- require('module.sudo') -- write with sudo premission
-- require('module.figlet') -- write with sudo premission
-- -- these modules are in `lua/module.tmp/`
-- -- }}}

require('plugin') -- packer plugin-manager

---- plugins {{{
--local plugins = {
--	'lsp-2',             -- lsp setup
--	'mason',           -- lsp installer
--	'symbols-outline', -- symbols
--	'colorizer',       -- render colors
--	'lualine',         -- status line
--	'treesitter',      -- treesitter settings
--	'treesitter.context', -- treesitter context settings
--	'which-key',       -- show keybinds
--	'gitsigns',        -- show `git diff` in line-number
--	'telescope',       -- Telescope
--	'undotree',        -- undotree
--	'venn',            -- draw ascii diagram
--	'truezen',         -- zen-mode: focus
--	'autopairs',       -- auto-close pairs
--	'guess-indent',
--	'tabs-vs-spaces',
--	'toggleterm',      -- terminal
--	'comment',         -- comment handler config
--	'bufferline',      -- status line
--	'notify',       -- notification manager
--	-- 'nvimtree',        -- nvim-tree
--	-- 'harpoon',
---- tmp {{{
--	-- 'trouble',      -- debug adapter protocol
--	-- 'null-ls',         -- null-ls
--	-- --'lsp',             -- lsp usage configs
--	-- --'cmp.bashls',
--	-- --'cmp.clangd',
--	-- --'cmp.gopls',
--	-- --'cmp.html-css',
--	-- --'cmp.lua_ls',
--	-- --'cmp.pyright',
--	-- --'cmp.texlab',
--	-- -- 'neotree',      -- NeoTree
--	-- -- 'alpha',           -- greetings at empty buffers
--	-- -- ---- these modules are in `lua/module/.tmp/`
--	-- -- 'harpoon',      -- new filebuffer
--	-- -- 'git-worktree', -- git worktree
---- }}}
----}

---- configurations {{{
---- Errors = {}
---- function PrintErrors(err)
---- 	for key, value in pairs(err) do
---- 		vim.notify(key, 4)
---- 		vim.notify(value, 3)
---- 	end
---- end
--local function plugthem(pluglist)
--	for _,name in ipairs(pluglist) do
--		local plugname = 'plugin.'..name
--		local stat, err = pcall(require, plugname)
--		if stat == false then
--			vim.notify(name..' is not installed or has a syntax error',
--			           4, {title = 'plugthem()'})
--			vim.notify(err, 3, {title = plugname})
--			if name == 'lualine' then
--				vim.cmd("so ~/.config/nvim/vim/ls.vim")
--			end
--			-- table.insert(Errors, {name = name, err = err})
----			vim.cmd ':PackerInstall'{{{
----			if name == 'mason' then
----				vim.cmd ':MasonUpdate'
----			elseif name == 'treesitter' then
----				vim.cmd ':TSUpdate'
----			end}}}
--		else
--			require(plugname)
--		end
--	end
--end

--plugthem(plugins)
---- }}}
-- }}}
