require('telescope').load_extension('fzf')
require('telescope').setup {
	defaults = {
		layout_strategy = 'horizontal',
		layout_config = {
			vertical = {
				width = 0.9,
				preview_width = 0.6,
			},
			horizontal = {
				width = 0.9,
				preview_width = 0.6,
			},
			center = {
				width = 0.9,
				preview_width = 0.6,
			},
			-- other layout configuration here
		},
		-- other defaults configuration here
	},

	extensions = {
		fzf = {
			fuzzy = true,                    -- false will only do exact matching
			override_generic_sorter = true,  -- override the generic sorter
			override_file_sorter = true,     -- override the file sorter
			case_mode = "smart_case",        -- or "ignore_case" or "respect_case"
			-- the default case_mode is "smart_case"
		}
	}
}

local builtin = require('telescope.builtin')

-- keybindings {{{
vim.keymap.set('n', '<leader>qq', builtin.builtin, -- buffers
	{ noremap = true, desc = 'Telescope › Buffers'})

vim.keymap.set('n', '<leader>qw', builtin.git_files, -- grep into project files
	{ noremap = true, desc = 'Telescope › search git files'})

vim.keymap.set('n', '<leader>qs', builtin.live_grep, -- grep into project files
	{ noremap = true, desc = 'Telescope › Live grep project files'})

--map('n', '<leader>qs', builtin.grep_string, -- find word
--	{ noremap = true, desc = 'Telescope › find word'})

vim.keymap.set('n', '<leader>qf', builtin.find_files, -- search and find files
	{ noremap = true, desc = 'Telescope › Find files'})

-- search and find files
vim.keymap.set('n', '<leader>qg', function()
	local str = vim.fn.input("Grep > ")
	if str ~= nil then
		builtin.grep_string({ search = str })
	else
		vim.print("grep: No str")
	end
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
