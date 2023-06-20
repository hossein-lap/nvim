---- helper {{{
---- map {{{
--local function map(mode, key, command, opts)
--	local options = { noremap = true }
--	if opts then
--		options = vim.tbl_extend("force", options, opts)
--	end
--	vim.api.nvim_set_keymap(mode, key, command, options)
--end
---- }}}
---- umap {{{
--local function umap(mode, key)
--	if not mode or not key then
--		vim.notify('umap(mode, key) must have at least two arguments', 4,
--			{title = 'Error on using umap()'})
--		return 1
--	end
--	vim.api.nvim_del_keymap(mode, key)
--end
---- }}}
---- au {{{
--local function au(commands, patterns, evnt)
--	if evnt == nil then
--		evnt = 'FileType'
--	end
--	vim.api.nvim_create_autocmd(evnt, {
--		pattern = patterns,
--		command = commands,
----		group = patterns .. 'groups'
--	})
--end
---- }}}
---- }}}
---- configs {{{
--require('telescope').setup{
--	defaults = {
--		-- Default configuration for telescope goes here:
--		-- config_key = value,
--		mappings = {
--			i = {
--				-- map actions.which_key to <C-h> (default: <C-/>)
--				-- actions.which_key shows the mappings for your picker,
--				-- e.g. git_{create, delete, ...}_branch for the git_branches picker
--				["<C-h>"] = "which_key"
--			},
--			n = {
--				["<leader>qd"] = "Telescope diagnostics"
--			}
--		}
--	},
--	pickers = {
--		-- Default configuration for builtin pickers goes here:
--		-- picker_name = {
--		--	 picker_config_key = value,
--		--	 ...
--		-- }
--		-- Now the picker_config_key will be applied every time you call this
--		-- builtin picker
--	},
--	extensions = {
--		-- Your extension configuration goes here:
--		-- extension_name = {
--		--	 extension_config_key = value,
--		-- }
--		-- please take a look at the readme of the extension you want to configure
--	}
--}
--
---- }}}

--require('telescope').load_extension('fzy_native')
local builtin = require('telescope.builtin')

-- keybindings {{{
vim.keymap.set('n', '<leader>qq', builtin.buffers, -- buffers
	{ noremap = true, desc = 'Telescope › Buffers'})

vim.keymap.set('n', '<leader>qw', builtin.git_files, -- grep into project files
	{ noremap = true, desc = 'Telescope › search git files'})

vim.keymap.set('n', '<leader>qg', builtin.live_grep, -- grep into project files
	{ noremap = true, desc = 'Telescope › Live grep project files'})

--map('n', '<leader>qs', builtin.grep_string, -- find word
--	{ noremap = true, desc = 'Telescope › find word'})

vim.keymap.set('n', '<leader>qs', builtin.find_files, -- search and find files
	{ noremap = true, desc = 'Telescope › Find files'})

-- search and find files
vim.keymap.set('n', '<leader>qf', function() builtin.grep_string({
	search = vim.fn.input("grep < ")})
end, { noremap = true, desc = 'Telescope › Find files (with word)'})

vim.keymap.set('n', '<leader>qd', builtin.diagnostics, -- diagnostics
	{ noremap = true, desc = 'Telescope › Diagnostics'})

vim.keymap.set('n', '<leader>qm', builtin.man_pages, -- man pages
	{ noremap = true, desc = 'Telescope › man pages'})

vim.keymap.set('n', '<leader>qh', builtin.help_tags, -- help pages
	{ noremap = true, desc = 'Telescope › help pages'})

vim.keymap.set('n', '<leader>qt', builtin.treesitter, -- treesitter diag
	{ noremap = true, desc = 'Telescope › Treesitter diag'})

vim.keymap.set('n', '<leader>qe', builtin.resume, -- resume last section
	{ noremap = true, desc = 'Telescope › Continue last Telescope command'})

vim.keymap.set('n', '<leader>qc', builtin.commands, -- list of available commands
	{ noremap = true, desc = 'Telescope › List of available commands'})

vim.keymap.set('n', '<leader>q/', builtin.current_buffer_fuzzy_find, -- fzf current buffer
	{ noremap = true, desc = 'Telescope › fzf current buffer'})

vim.keymap.set('n', '<leader>qa', builtin.command_history, -- ex history
	{ noremap = true, desc = 'Telescope › ex commands history'})

vim.keymap.set('n', '<leader>qr', builtin.reloader, -- reload modules
	{ noremap = true, desc = 'Telescope › Reload modules'})

vim.keymap.set('n', '<leader>qk', builtin.keymaps, -- all keybinds
	{ noremap = true, desc = 'Telescope › All keybinds'})
-- }}}
