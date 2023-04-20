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
--require('telescope').load_extension('fzy_native')
---- }}}
-- keybindings {{{
-- helper {{{
-- map {{{
local function map(mode, key, command, opts)
	local options = { noremap = true }
	if opts then
		options = vim.tbl_extend("force", options, opts)
	end
	vim.api.nvim_set_keymap(mode, key, command, options)
end
-- }}}
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
-- au {{{
local function au(commands, patterns, evnt)
	if evnt == nil then
		evnt = 'FileType'
	end
	vim.api.nvim_create_autocmd(evnt, {
		pattern = patterns,
		command = commands,
--		group = patterns .. 'groups'
	})
end
-- }}}
local tlc = require('telescope.builtin')
-- }}}

map('n', '<leader>qq', ':Telescope buffers<CR>', -- buffers
	{ desc = 'Telescope › Buffers'})

map('n', '<leader>qg', ':Telescope live_grep<CR>', -- grep into project files
	{ desc = 'Telescope › Live grep project files'})

--map('n', '<leader>qs', ':Telescope grep_string<CR>', -- find word
--	{ desc = 'Telescope › '})

map('n', '<leader>qs', ':Telescope find_files<CR>', -- search and find files
	{ desc = 'Telescope › Find files'})

map('n', '<leader>qd', ':Telescope diagnostics<CR>', -- diagnostics
	{ desc = 'Telescope › Diagnostics'})

map('n', '<leader>qm', ':Telescope man_pages<CR>', -- man pages
	{ desc = 'Telescope › man pages'})

map('n', '<leader>qh', ':Telescope help_tags<CR>', -- help pages
	{ desc = 'Telescope › help pages'})

map('n', '<leader>qt', ':Telescope treesitter<CR>', -- treesitter diag
	{ desc = 'Telescope › Treesitter diag'})

map('n', '<leader>qe', ':Telescope resume<CR>', -- resume last section
	{ desc = 'Telescope › Continue last Telescope command'})

map('n', '<leader>qc', ':Telescope commands<CR>', -- list of available commands
	{ desc = 'Telescope › List of available commands'})

map('n', '<leader>q/', ':Telescope current_buffer_fuzzy_find<CR>', -- fzf current buffer
	{ desc = 'Telescope › fzf current buffer'})

map('n', '<leader>qa', ':Telescope command_history<CR>', -- ex history
	{ desc = 'Telescope › ex commands history'})

map('n', '<leader>qr', ':Telescope reloader<CR>', -- reload modules
	{ desc = 'Telescope › Reload modules'})

map('n', '<leader>qk', ':Telescope keymaps<CR>', -- all keybinds
	{ desc = 'Telescope › All keybinds'})
-- }}}
