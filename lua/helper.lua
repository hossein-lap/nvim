-- some variables
HOME = os.getenv("HOME")
NHOME = HOME .. '/.config/nvim'
set = vim.opt
cmd = vim.cmd
api = vim.api

-- set <leader> key
vim.g.mapleader = '\\'

-- autocmd function {{{
function au(patterns, commands, evnt)
	if evnt == nil then
		evnt = 'FileType'
	end
	api.nvim_create_autocmd(evnt, {
		pattern = patterns,
		command = commands,
		-- group = patterns .. 'groups'
	})
end
-- }}}
-- key mapping function {{{
function map(mode, key, command, opts)
	local options = { noremap = true }
	if opts then
		options = vim.tbl_extend("force", options, opts)
	end
	api.nvim_set_keymap(mode, key, command, options)
end
-- }}}
--
function umap(mode, key)
	if not mode or not key then
		print('Error on using umap()')
		print('umap(mode, key) must have both arguments')
		return 1
	end
	api.nvim_del_keymap(mode, key)
end
