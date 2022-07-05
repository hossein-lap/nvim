-- autocmd function {{{
function au(patterns, commands, evnt)
	if evnt == nil then
		evnt = 'FileType'
	end
	vim.api.nvim_create_autocmd(evnt, {
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
	vim.api.nvim_set_keymap(mode, key, command, options)
end
-- }}}
